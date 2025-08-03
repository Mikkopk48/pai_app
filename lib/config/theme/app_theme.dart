import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF0077FF);
  static const secondary = Color(0xFFFF6D3F);
  static const background = Color(0xFFFEBD59);
  static const textGray = Color(0xFF999999);
  static const textBlack = Color(0xDD000000);
  static const white = Color(0xFFFFFFFF);
}

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: const TextTheme(),
    );
  }
}
