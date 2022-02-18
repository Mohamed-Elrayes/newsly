import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({
    Key? key,
    this.physics,
    required this.itemCount,
    this.scrollDirection,
    this.separatorBuilder,
    this.itemBuilder,
    this.scrollController,
    this.childBuilderAnimated,
  }) : super(key: key);

  final int itemCount;
  final Axis? scrollDirection;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final Widget Function(BuildContext, int)? itemBuilder;
  final Widget Function(BuildContext, int)? childBuilderAnimated;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
        controller: scrollController,
        primary: false,
        physics: physics,
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: scrollDirection ?? Axis.vertical,
        separatorBuilder: separatorBuilder ?? _separate,
        itemBuilder: itemBuilder ?? _animatedList,
      ),
    );
  }

  Widget _separate(BuildContext context, int index) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(seconds: 1),
      child: const SlideAnimation(
        // verticalOffset: 44.0,
        horizontalOffset: 50,
        child: FadeInAnimation(
          child: SizedBox(
            height: 50,
            child: Divider(),
          ),
        ),
      ),
    );
  }

  Widget _animatedList(BuildContext context, int index) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        verticalOffset: 44.0,
        child: FadeInAnimation(
          child: childBuilderAnimated!(context, index),
        ),
      ),
    );
  }
}
