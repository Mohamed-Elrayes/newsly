import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
     this.onTap,
    required this.label,
    this.widget
  }) : super(key: key);
  final VoidCallback? onTap;
  final String label;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: widget ??
            CustomTextWidget(
              label,
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(color: Theme.of(context).colorScheme.background),
            ));
  }
}
