import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  Brightness get currentBrightness => AppThemeData.currentSystemBrightness;
  ThemeCubit()
      : super(ThemeState(
            themeMode: AppThemeData.currentSystemBrightness == Brightness.light
                ? ThemeMode.light
                : ThemeMode.dark)) {
    updateAppTheme();
  }
  void updateAppTheme() {
    currentBrightness == Brightness.light
        ? _setTheme(ThemeMode.light)
        : _setTheme(ThemeMode.dark);
  }

  void setUpdateAppThemeManual() {
    state.themeMode == ThemeMode.light
        ? _setTheme(ThemeMode.dark)
        : _setTheme(ThemeMode.light);
  }

  void _setTheme(ThemeMode themeMode) {
    // WidgetAppTheme.currentThemeMode = themeMode;
    AppThemeData.setStatusBarAndNavigationBarColors(themeMode);
    emit(ThemeState(themeMode: themeMode));
  }
}
