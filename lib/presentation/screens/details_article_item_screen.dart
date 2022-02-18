import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/constants.dart';
import '../../core/route/routes_name.dart';
import '../../data/models/generate/article/article_item_model.dart';
import '../../data/repositories/const_func_repository.dart';
import '../../logic/cubit/bookmark/bookmark_cubit.dart';
import '../widgets/widgets.dart';

class DetailsArticleItemScreen extends StatelessWidget {
  final bool isPressed = false;
  final ArticleItem articleItemModel;
  const DetailsArticleItemScreen({
    Key? key,
    required this.articleItemModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _provider = context.read<BookmarkCubit>();
    return Scaffold(
      appBar: _AppBarWidget(
        handelShareIcon: () {
          ConstFuncRepository.shareLink(
              '${articleItemModel.title} \n ${articleItemModel.url}');
        },
        bookMarkButtonIcon: BlocBuilder<BookmarkCubit, BookmarkState>(
          builder: (context, state) {
            return IconButton(
              iconSize: 20,
              icon: Icon(
                _provider.isExist(articleItemModel.url!) == true
                    ? bookMarkIcon
                    : bookMarkOutLineIcon,
              ),
              onPressed: () {
                _provider.bookmarkToggle(
                  articleItem: articleItemModel,
                );
              },
            );
          },
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 230,
            pinned: true,
            floating: false,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: ValueKey(articleItemModel),
                child: ImageNetworkWidget(
                  clipImage: false,
                  boxFit: BoxFit.cover,
                  imageUrl: articleItemModel.image.toString(),
                ),
              ),
            ),
          ),
        ],
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomTextWidget.title(
                articleItemModel.title!,
                maxLines: 3,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.66,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              maxRadius: 24,
                              backgroundImage: AssetImage('assets/avatar.png'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: CustomTextWidget.customSubTitle(
                                articleItemModel.author != null
                                    ? articleItemModel.author!
                                    : 'No Author',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      CustomTextWidget.subTitle(
                        convertTime(articleItemModel.publishedAt),
                        widthBox: constraints.maxWidth * 0.33,
                      )
                    ],
                  );
                })
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20, top: 10, right: 12, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _IconLabelActiveArticle(
                    icon: commentIcon,
                    label: 'comment',
                    number: '8',
                    onTap: () {},
                  ),
                  _IconLabelActiveArticle(
                    icon: loveOutlineIcon,
                    label: 'likes',
                    number: '34',
                    onTap: () {},
                  ),
                  _IconLabelActiveArticle(
                    icon: shareOutIcon,
                    label: 'share',
                    onTap: () {
                      ConstFuncRepository.shareLink(
                        '${articleItemModel.title} \n ${articleItemModel.url}',
                      );
                    },
                  ),
                  _IconLabelActiveArticle(
                    icon: webIcon,
                    label: 'source',
                    onTap: () {
                      Navigator.of(context).pushNamed(RoutesName.webViewPath,
                          arguments: articleItemModel.url!);
                    },
                  ),
                ],
              ),
            ),
            CustomTextWidget.paragraph(
                (articleItemModel.description! + loremString)
                    .split('.')
                    .join('.\n')),
          ],
        ),
      ),
    );
  }
}

class _IconLabelActiveArticle extends StatelessWidget {
  const _IconLabelActiveArticle({
    Key? key,
    this.number,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String? number;
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
            ),
            const SizedBox(
              width: 3,
            ),
            number != null
                ? CustomTextWidget.subTitleBold('$number ')
                : const SizedBox(),
            CustomTextWidget.subTitleBold(label),
          ],
        ),
      ),
    );
  }
}

class _AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  _AppBarWidget({
    Key? key,
    required this.bookMarkButtonIcon,
    required this.handelShareIcon,
  }) : super(key: key);
  final Widget bookMarkButtonIcon;
  final VoidCallback handelShareIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        bookMarkButtonIcon,
        IconButton(
          iconSize: 24,
          onPressed: handelShareIcon,
          icon: const Icon(shareIcon),
        )
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(arrowBackIcon),
      ),
    );
  }

  final AppBar _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
