import 'package:flutter/material.dart';

import 'widgets.dart';

class DialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback okPressed;
  const DialogWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.okPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomTextWidget.title(title),
      content: CustomTextWidget.paragraph(content),
      actions: [
        TextButton(onPressed: okPressed, child:const CustomTextWidget("ok")),
      ],
    );
  }
}
