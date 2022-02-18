part of 'app_theme.dart';

class WidgetAppTheme {
  static late ColorScheme _colorScheme;
  static void setterColorScheme(colorScheme) => _colorScheme = colorScheme;

  static InputDecorationTheme get inputDecoration => const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1.0),
        ),
      );

  static IconThemeData get iconThemeData =>
      IconThemeData(color: _colorScheme.onPrimary);

  static AppBarTheme get appBarTheme => AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: _colorScheme.primary !=AppColors.blackColor  ? Brightness.light : Brightness.dark),
        // toolbarHeight: 50,
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: _colorScheme.primary),
      );

  static BottomNavigationBarThemeData get bottomNavBar =>
      BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: _colorScheme.onPrimary,
        unselectedItemColor: _colorScheme.secondaryVariant,
      );

  static TabBarTheme get tabBarTheme => TabBarTheme(
        labelColor: _colorScheme.secondary,
        labelPadding: const EdgeInsets.symmetric(horizontal: 3),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: _colorScheme.primary),
        unselectedLabelColor: _colorScheme.secondaryVariant,
      );

  static ElevatedButtonThemeData get elevatedButton => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: _colorScheme.onPrimary,
          onPrimary: _colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100))));
}
