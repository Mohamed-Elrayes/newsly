import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';

import '../../core/route/routes_name.dart';
import '../../logic/cubit/bookmark/bookmark_cubit.dart';
import '../widgets/article_item_post_widget.dart';
import '../widgets/articles_list_widget.dart';
import '../widgets/custom_text_widget.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget.title('Bookmark'),
      ),
      body: BlocBuilder<BookmarkCubit, BookmarkState>(
        builder: (context, state) {
          if (state.articleList.isEmpty) {
            return const _BuildTextCenter(
              text: 'Try add Article to Favorite..',
            );
          }
          return ArticlesListView(
            itemCount: state.articleList.length,
            childBuilderAnimated: (context, int index) {
              return ArticleItemPost(
                articleItem: state.articleList[index],
                onTap: () => Navigator.of(context).pushNamed(
                    RoutesName.detailArticleItemPath,
                    arguments: state.articleList[index]),
              );
            },
          );
        },
      ),
    );
  }
}

class _BuildTextCenter extends StatelessWidget {
  const _BuildTextCenter({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomTextWidget(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
