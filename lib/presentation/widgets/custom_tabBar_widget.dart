import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/constant_iteration.dart';
import 'widgets.dart';

import '../../logic/bloc/articles/articles_bloc.dart';


class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        return TabBar(
          onTap: onTap,
          indicatorWeight: 0,
          indicator: Theme.of(context).tabBarTheme.indicator,
          isScrollable: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          // dragStartBehavior: DragStartBehavior.down,
          tabs: kindArticles.map((e) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: e.isSelected
                      ? null
                      : Theme.of(context).colorScheme.primaryVariant),
              child: Tab(
                height: 35,
                child: CustomTextWidget(
                  e.headLine,
                  customColorText: true,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
