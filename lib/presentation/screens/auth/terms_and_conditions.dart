import 'dart:math';

import 'package:flutter/material.dart';
import '../../../core/constants/icon_constant.dart';
import '../../../core/constants/strings.dart';

import '../../widgets/widgets.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TweenAnimationBuilder(
          child: CustomTextWidget.title('Terms & Conditions'),
          tween: Tween<double>(begin: 0, end: 10),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeIn,
          builder: (context, double value, child) => Opacity(
            opacity: value * 0.1,
            child: Transform.translate(
              offset: Offset(0, -10 + value),
              child: child,
            ),
          ),
        ),
        leadingWidth: 30,
        leading: IconButton(
          onPressed: ()=>Navigator.of(context).pop(),
          icon: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 1200),
            tween: Tween<double>(begin: 0, end: 10),
          curve: Curves.easeIn,
            child: Icon(
              arrowBackIcon,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            builder: (context, double value, child) => Opacity(
              opacity: value * 0.1,
              child: Transform.rotate(
                angle: pi /( 10.0 *value),
                child: child,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) => CustomParagraph(
          title: termsAndCondition.keys.elementAt(index),
          paragraph: termsAndCondition.values.elementAt(index),
        ),
        itemCount: termsAndCondition.keys.length,
      ),
    );
  }
}

class CustomParagraph extends StatelessWidget {
  const CustomParagraph({
    Key? key,
    required this.title,
    required this.paragraph,
  }) : super(key: key);
  final String title;
  final String paragraph;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget.title(title),
        CustomTextWidget.paragraph(paragraph),
      ],
    );
  }
}
