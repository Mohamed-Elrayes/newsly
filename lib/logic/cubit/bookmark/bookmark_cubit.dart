import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../../../data/data.dart';

import '../../../core/constants/strings.dart';
import '../../../data/models/generate/bookmark_hive/bookmark_item.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(const BookmarkState());

  bool isExist(String slug) => state.articleList.any((e) => e.url == slug);
  int _getIndex(ArticleItem item) => state.articleList.indexWhere((e) => e.url == item.url);

  // On Toggle Tap .....
  void bookmarkToggle({required ArticleItem articleItem}) async {
    logger.wtf(articleItem.url);

    if (!isExist(articleItem.url!)) {
      _addItem(articleItem);
    } else {
      final index = _getIndex(articleItem);
      logger.e(index);
      _deleteItem(index);
    }
  }

  // Add New Bookmark .....
  void _addItem(ArticleItem articleItem) async {
    var box = await Hive.openBox<BookmarkHive>('bookmark');

    logger.i(articleItem);

    box.add(BookmarkHive(
      author: articleItem.author,
      category: articleItem.category,
      country: articleItem.country,
      description: articleItem.description,
      image: articleItem.image,
      language: articleItem.language,
      publishedAt: articleItem.publishedAt,
      source: articleItem.source,
      title: articleItem.title,
      url: articleItem.url,
    ));
    await getBookmarks();
  }

  // Delete Bookmark .....
  void _deleteItem(int index) async {
    logger.w(index);
    var box = await Hive.openBox<BookmarkHive>('bookmark');
    box.deleteAt(index);
    await getBookmarks();
  }

  // Get All Bookmark .....
  Future<void> getBookmarks() async {
    final box = await Hive.openBox<BookmarkHive>('bookmark');
    List<ArticleItem> articleList = [];
    List<BookmarkHive> bookmarkHiveList = [];

    bookmarkHiveList = box.values.toList();
    for (var e in bookmarkHiveList) {
      articleList.add(ArticleItem(
        author: e.author,
        category: e.category,
        country: e.country,
        description: e.description,
        image: e.image,
        language: e.language,
        publishedAt: e.publishedAt,
        source: e.source,
        title: e.title,
        url: e.url,
      ));
    }
    emit(state.copyWith(articleList: articleList));
  }
}
