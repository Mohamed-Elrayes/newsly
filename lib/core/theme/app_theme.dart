import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
part './text_app_theme.dart';
part './color_scheme_theme.dart';
part './widget_app_theme.dart';

class AppThemeData {
  const AppThemeData._();
  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance!.window.platformBrightness;
  static late ThemeMode themeMode;

  static ThemeData lightThemeData = themeData(AppColors.lightColorScheme);
  static ThemeData darkThemeData = themeData(AppColors.darkColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    WidgetAppTheme.setterColorScheme(colorScheme);
    TextAppTheme.setterColorScheme(colorScheme);

    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: colorScheme,
      primaryIconTheme: WidgetAppTheme.iconThemeData,
      iconTheme: WidgetAppTheme.iconThemeData,
      primaryColor: colorScheme.primary,
      toggleableActiveColor: colorScheme.onPrimary,
      scaffoldBackgroundColor: colorScheme.background,
      inputDecorationTheme: WidgetAppTheme.inputDecoration,
      // listTileTheme: ListTileThemeData(textColor: colorScheme.primary),
      primaryTextTheme:
          GoogleFonts.sourceSansProTextTheme(TextAppTheme.textTheme),
      // indicatorColor: Colors.transparent,
      elevatedButtonTheme: WidgetAppTheme.elevatedButton,
      tabBarTheme: WidgetAppTheme.tabBarTheme,
      bottomNavigationBarTheme: WidgetAppTheme.bottomNavBar,
      appBarTheme: WidgetAppTheme.appBarTheme,
      textTheme: GoogleFonts.sourceSansProTextTheme(TextAppTheme.textTheme),
    );
  }

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? AppColors.lightGrayColor
          : AppColors.blackColorDark,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}
