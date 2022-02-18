part of 'app_theme.dart';

class AppColors {
  static const Color blackColor = Color(0xFF180E19);
  static const Color grayColor = Color(0xFF909090);
  static const Color lightGrayColor = Color(0xFFEEEEEE);
  static const Color whiteColor = Colors.white;
  static const Color blackColorDark = Color(0xFF1C1C1C);

  static ColorScheme get lightColorScheme => const ColorScheme.light(
      primary:AppColors.blackColor,
      secondary: AppColors.whiteColor,
      primaryVariant: AppColors.lightGrayColor,
      secondaryVariant: AppColors.grayColor,
      background: AppColors.whiteColor,
      onBackground: AppColors.blackColor,
      onPrimary: AppColors.blackColor,
      onSecondary: AppColors.blackColor,
      onSurface: AppColors.blackColor);

  static ColorScheme get darkColorScheme => const ColorScheme.dark(
      primary: AppColors.whiteColor,
      secondary: AppColors.blackColor,
      primaryVariant: AppColors.grayColor,
      secondaryVariant: AppColors.lightGrayColor,
      background: AppColors.blackColorDark,
      onBackground: AppColors.whiteColor,
      onPrimary: AppColors.whiteColor,
      onSecondary: AppColors.whiteColor,
      onSurface: AppColors.whiteColor);
}
