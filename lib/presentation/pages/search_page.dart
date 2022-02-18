import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/route/routes_name.dart';
import '../widgets/widgets.dart';
import '../../core/constants/constants.dart';
import '../../logic/bloc/search/search_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(

            title: TextField(
              autofocus: false,
              onChanged: (wordSearch) => context
                  .read<SearchBloc>()
                  .add(SearchEvent(searchWord: wordSearch)),
              cursorColor: Theme.of(context).colorScheme.onPrimary,
              style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 17),
              decoration: InputDecoration(
                filled: true,
                // fillColor: Theme.of(context).colorScheme.primaryVariant,
                contentPadding: EdgeInsets.zero,
                // hintMaxLines: 2,
                hintText: 'Search',
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontSize: 17),
                // suffixIcon: IconButton(
                //   padding: EdgeInsets.zero,
                //   iconSize: 17,
                //   icon: const Icon(
                //     Icons.highlight_remove,
                //     // size: 17,
                //   ),
                //   onPressed: () {},
                // ),
                prefixIcon: const Icon(
                  searchIcon,
                  size: 17,
                  // color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                switch (state.status) {
                  case SearchStates.loading:
                    return const ShimmerWidget();
                  case SearchStates.failed:
                    return _BuildTextCenter(
                      text: state.errorMessage!,
                    );
                  case SearchStates.empty:
                    return const _BuildTextCenter(
                      text: 'Try Now: Type something',
                    );

                  default:
                    if (state.status == SearchStates.success &&
                        state.articlesDataSearched.isEmpty) {
                      return const _BuildTextCenter(
                        text: 'No result',
                      );
                    } else {
                      return ArticlesListView(
                        itemCount: state.articlesDataSearched.length,
                        childBuilderAnimated: (context, int i) {
                          return ArticleItemPost(
                            articleItem: state.articlesDataSearched[i],
                            onTap: () => Navigator.of(context).pushNamed(
                                RoutesName.detailArticleItemPath,
                                arguments: state.articlesDataSearched[i]),
                          );
                        },
                      );
                    }
                }
              },
            ),
          ),
        );
      }),
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
