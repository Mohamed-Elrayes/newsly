import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool? softWrap;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextWidthBasis? textWidthBasis;
  final TextDirection? textDirection;
  final bool colorTest;
  final bool customColorText;
  final double? widthBox;
  const CustomTextWidget(
    this.text, {
    Key? key,
    this.style,
    this.softWrap,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.textWidthBasis,
    this.textDirection,
    this.colorTest = false,
    this.customColorText = false,
    this.widthBox,
  }) : super(key: key);

  CustomTextWidget.paragraph(
    this.text, {
    Key? key,
    this.textDirection,
    this.textWidthBasis,
    this.colorTest = false,
      this.customColorText = false,
    this.widthBox,
  })  : style = TextAppTheme.textTheme.bodyText2?.copyWith(height: 2),
        maxLines = null,
        softWrap = true,
        overflow = null,
        textAlign = TextAlign.start,
        super(key: key);

  CustomTextWidget.subTitle(
    this.text, {
    Key? key,
    this.textDirection,
    this.colorTest = false,
      this.customColorText = false,
    this.widthBox,
  })  : style = TextAppTheme.textTheme.headline3,
        maxLines = 1,
        softWrap = true,
        overflow = TextOverflow.ellipsis,
        textAlign = TextAlign.start,
        textWidthBasis = null,
        super(key: key);
  CustomTextWidget.subTitleBold(
    this.text, {
    Key? key,
    this.textDirection,
    this.colorTest = false,
      this.customColorText = false,
    this.widthBox,
  })  : style = TextAppTheme.textTheme.headline3?.copyWith(fontWeight: FontWeight.w800),
        maxLines = 1,
        softWrap = true,
        overflow = TextOverflow.ellipsis,
        textAlign = TextAlign.start,
        textWidthBasis = null,
        super(key: key);
  const CustomTextWidget.customSubTitle(
    this.text, {
    Key? key,
    this.style,
    this.textDirection,
    this.colorTest = false,
      this.customColorText = false,
    this.widthBox,
  })  : maxLines = 1,
        softWrap = true,
        overflow = TextOverflow.ellipsis,
        textAlign = TextAlign.start,
        textWidthBasis = null,
        super(key: key);
  CustomTextWidget.title(
    this.text, {
    Key? key,
    this.maxLines,
    this.textWidthBasis,
    this.textDirection,
    this.colorTest = false,
      this.customColorText = false,
    this.widthBox,
  })  : style = TextAppTheme.textTheme.bodyText1,
        softWrap = true,
        overflow = TextOverflow.ellipsis,
        textAlign = TextAlign.start,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: Theme.of(context).colorScheme.primary
        );
    return Container(
      width: widthBox,
      color: colorTest ? Colors.red : null,
      child: Text(text,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          softWrap: softWrap,
          style: customColorText?  style ?? TextAppTheme.textTheme.headline3: textStyle.merge(style ?? TextAppTheme.textTheme.headline3) ,
          maxLines: maxLines,
          textDirection: textDirection,
          overflow: overflow),
    );
  }
}
