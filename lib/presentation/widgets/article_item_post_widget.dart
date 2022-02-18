import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/constants.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/generate/article/article_item_model.dart';
import '../../data/repositories/const_func_repository.dart';
import '../../logic/cubit/bookmark/bookmark_cubit.dart';
import 'widgets.dart';

class ArticleItemPost extends StatelessWidget {
  const ArticleItemPost({
    Key? key,
    required this.articleItem,
    required this.onTap,
  }) : super(key: key);
  final ArticleItem articleItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context).size;
    return Ink(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(200)),
      child: InkWell(
        onTap: onTap,
        highlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                // color: Colors.red,
                // width: mediaQuery.width * 0.4 - 5 - 16,
                height: 147,
                child: Hero(
                    tag: ValueKey(articleItem),
                    child: ImageNetworkWidget(
                      boxFit: BoxFit.cover,
                      imageUrl: articleItem.image.toString(),
                    )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                // color: Colors.red,
                // width: mediaQuery.width * 0.6 - 5 - 16,
                // width: constraints.maxWidth,
                height: 147,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextWidget.title(
                        articleItem.title.toString(),
                        textWidthBasis: TextWidthBasis.longestLine,
                        maxLines: 3,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget.customSubTitle(
                            articleItem.author != null
                                ? articleItem.author.toString()
                                : 'No Author',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          SizedBox(
                            width: double.infinity,
                            // color: Colors.red,
                            child: LayoutBuilder(builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Row(
                                children: [
                                  CustomTextWidget.customSubTitle(
                                    articleItem.category.toString(),
                                    widthBox: constraints.minWidth * 0.21,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        ?.copyWith(color: Colors.blue[300]),
                                  ),
                                  Container(
                                    width: constraints.minWidth * 0.15,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: const CircleAvatar(
                                      backgroundColor: AppColors.grayColor,
                                      minRadius: 5,
                                    ),
                                  ),
                                  CustomTextWidget.subTitle(
                                    convertTime(articleItem.publishedAt),
                                    widthBox: constraints.minWidth * 0.49,
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                      width: constraints.minWidth * 0.15,
                                      child: _PopUpMenuWidget(
                                          articleItem: articleItem)),
                                ],
                              );
                            }),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PopUpMenuWidget extends StatelessWidget {
  const _PopUpMenuWidget({
    Key? key,
    required this.articleItem,
  }) : super(key: key);

  final ArticleItem articleItem;

  @override
  Widget build(BuildContext context) {
    final _provider = context.read<BookmarkCubit>();
    return PopupMenuButton(
      icon: const Icon(dots),
      tooltip: 'more',
      // color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      itemBuilder: (context) => <PopupMenuItem>[
        PopupMenuItem(
          child: const _ChildPopMenuItem(icon: shareIcon, label: 'Share'),
          onTap: () {
            ConstFuncRepository.shareLink(
                '${articleItem.title} \n ${articleItem.url}');
          },
        ),
        PopupMenuItem(
          child: BlocBuilder<BookmarkCubit, BookmarkState>(
              builder: (context, state) {
            return _ChildPopMenuItem(
                icon: _provider.isExist(articleItem.url!) == true
                    ? bookMarkIcon
                    : bookMarkOutLineIcon,
                label: 'Bookmark');
          }),
          onTap: () {
            _provider.bookmarkToggle(
              articleItem: articleItem,
            );
          },
        )
      ],
    );
  }
}

class _ChildPopMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ChildPopMenuItem({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
          ),
          const SizedBox(
            width: 15,
          ),
          CustomTextWidget.customSubTitle(label,
              style: TextAppTheme.textTheme.headline3),
        ],
      ),
    );
  }
}
