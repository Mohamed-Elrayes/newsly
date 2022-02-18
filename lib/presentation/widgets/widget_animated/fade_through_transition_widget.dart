import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeThroughTransitionWidget extends StatelessWidget {
  final Widget child;
  // final Color? fillColor;
  const FadeThroughTransitionWidget({
    Key? key,
    required this.child,
    //  this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (child, animation, secondaryAnimation) {
        return FadeThroughTransition(
          fillColor:  Colors.transparent,
          child: child,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
        );
      },
      child: child,
    );
  }
}
