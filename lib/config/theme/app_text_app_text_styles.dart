import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppTextStyles {
  static const TextStyle cardTitleTextStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: Color(0xDD000000),
  );

  static const TextStyle inputTextTextStyle = TextStyle(
    fontSize: 20,
    color: Color(0xFF9E9E9E),
  );

  static const TextStyle bigButtonTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Color(0xFFFFFFFF),
  );

  static const TextStyle smallTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Color(0xDD000000),
  );
  static const TextStyle smallBoldTextOrange = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.secondary,
  );
    static const TextStyle smallBoldTextBlue = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
}
