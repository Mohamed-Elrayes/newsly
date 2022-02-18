part of 'app_theme.dart';

class TextAppTheme {
  static void setterColorScheme(ColorScheme colorScheme) => _colorScheme = colorScheme;
  static late ColorScheme _colorScheme;
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  // static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w800;
  static TextStyle textStyle =  TextStyle(
    letterSpacing: -0.17,
    fontSize: 15,
    fontWeight: _medium,
    // color: _colorScheme.primary
  );
  static final TextTheme textTheme = TextTheme(
    headline1: textStyle.copyWith(fontWeight: _bold),
    headline2: textStyle.copyWith(fontSize: 14),
    headline3: textStyle.copyWith(fontSize: 13),
    button: textStyle.copyWith(fontSize: 14),
    bodyText1: textStyle.copyWith(fontWeight: _bold, fontSize: 18),
    bodyText2: textStyle.copyWith(fontWeight: _regular),
    subtitle1: textStyle.copyWith(fontSize: 13),
  );
}
