import 'package:flutter/material.dart';
import 'package:pai/config/theme/theme.dart';

extension CustomTextTheme on TextTheme {
  TextStyle get cardTitleTextStyle => AppTextStyles.cardTitleTextStyle;
  TextStyle get inputTextTextStyle => AppTextStyles.inputTextTextStyle;
  TextStyle get bigButtonTextStyle => AppTextStyles.bigButtonTextStyle;
  TextStyle get smallTextStyle => AppTextStyles.smallTextStyle;
  TextStyle get smallBoldText => AppTextStyles.smallBoldText;
  TextStyle get smallBoldTextOrange => AppTextStyles.smallBoldTextOrange;
  TextStyle get smallBoldTextBlue => AppTextStyles.smallBoldTextBlue;
}
