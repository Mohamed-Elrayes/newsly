import 'package:flutter/material.dart';

import '../custom_text_widget.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
    required this.description,
  }) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.blueGrey,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextWidget(description),
          ),
          buildDivider(context),
        ],
      ),
    );
  }

  Expanded buildDivider(ctx) {
    return Expanded(
      child: Divider(
        height: 1.5,
        color: Theme.of(ctx).colorScheme.primary,
      ),
    );
  }
}
