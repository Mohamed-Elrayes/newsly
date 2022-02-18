part of 'bookmark_cubit.dart';

class BookmarkState extends Equatable {
  const BookmarkState({this.articleList = const []});
  final List<ArticleItem> articleList;

  BookmarkState copyWith({
    List<ArticleItem>? articleList,
  }) {
    return BookmarkState(
      articleList: articleList ?? this.articleList,
    );
  }

  @override
  List<Object> get props => [articleList];
}
