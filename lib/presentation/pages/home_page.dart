import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/core.dart';
import '../../core/route/routes_name.dart';
import '../../logic/bloc/articles/articles_bloc.dart';

import '../widgets/widgets.dart';

class ArticlesHomePage extends StatelessWidget {
  const ArticlesHomePage({Key? key}) : super(key: key);
  void onTap(int value, articleBlocState) {
    articleBlocState.initialPageTab = value;

    for (var element in kindArticles) {
      element != kindArticles[value]
          ? element.isSelected = false
          : element.isSelected = true;
    }

    articleBlocState
        .add(ArticlesFetch(categoryName: kindArticles[value].headLine));
  }

  @override
  Widget build(BuildContext context) {
    final articleBlocState = context.read<ArticlesBloc>();
    return DefaultTabController(
      length: kindArticles.length,
      initialIndex: articleBlocState.initialPageTab ?? 0,
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  const SliverAppBar(
                    // backgroundColor: Colors.red,
                    title: LogoImageAssets(
                      imageUrlDark: 'assets/logo_dark.png',
                      imageUrlLight: 'assets/logo.png',
                    ),
                    centerTitle: true,
                    pinned: true,
                    floating: false,
                    // expandedHeight: 230,
                    automaticallyImplyLeading: false,
                  ),
                  SliverAppBar(
                    primary: true,
                    toolbarHeight: 40,
                    // collapsedHeight: ,
                    pinned: true,
                    floating: false,
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    // backgroundColor: Colors.yellow,
                    title: CustomTabBarWidget(
                        onTap: (index) => onTap(index, articleBlocState)),
                  )
                ],
            body: const _TabBarViewBuild()),
      ),
    );
  }
}

class _TabBarViewBuild extends StatelessWidget {
  const _TabBarViewBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<ArticlesBloc, ArticlesState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          switch (state.status) {
            case ArticlesStatus.loading:
              return const ShimmerWidget();
            case ArticlesStatus.failure:
              return _BuildTextCenter(
                text: state.errorMessage!,
              );
            default:
              if (state.status == ArticlesStatus.success &&
                  state.articlesList.isEmpty) {
                return const _BuildTextCenter(
                  text: 'No result',
                );
              } else {
                return TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: kindArticles.map(
                      (e) {
                        return const _BuildArticlesListView();
                      },
                    ).toList());
              }
          }
        },
      ),
    );
  }
}

class _BuildArticlesListView extends StatelessWidget {
  const _BuildArticlesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return ArticlesListView(
            itemCount: state.hasReachedMax
                ? state.articlesList.length
                : state.articlesList.length + 1,
            scrollDirection: Axis.vertical,
            childBuilderAnimated: (context, int index) {
              if (index >= state.articlesList.length) {
                context.read<ArticlesBloc>().add(
                      ArticlesMoreFetch(
                          categoryName: kindArticles[
                                  DefaultTabController.of(context)!.index]
                              .headLine,
                          fetchMore: true),
                    );
              }
              return index >= state.articlesList.length
                  ? const BottomLoader()
                  : ArticleItemPost(
                      articleItem: state.articlesList[index],
                      onTap: () => Navigator.of(context).pushNamed(
                          RoutesName.detailArticleItemPath,
                          arguments: state.articlesList[index]),
                      // onDoubleTap: () =>
                      //     context.read<BookmarkCubit>().bookmarkToggle(
                      //           articleItem: state.articlesList[index],
                      //         ),
                    );
            },
          );
        });
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
