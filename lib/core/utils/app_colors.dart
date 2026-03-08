import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color(0xff1B5E37);
  static Color lightpPrimaryColor = const Color(0xFF2D9F5D);
  static Color secondaryColor = const Color(0xFFF4A91F);
  static Color lightSecondaryColor = const Color(0xFFF8C76D);
  static Color blackColor = const Color(0xff1F2C37);
  static Color greyColor = const Color(0xff9CA4AB);
  static Color whiteColor = Colors.white;

  // Dark Theme Colors
  static Color darkBackground = const Color(0xFF181A20);
  static Color darkContainer = const Color(0xFF1F222A);
}

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: AppColors.whiteColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    ),
  );
  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark,
    ),
  );
}
