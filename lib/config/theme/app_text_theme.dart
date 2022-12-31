import 'package:flutter/material.dart';
import 'package:skeleton_test/config/constants/app_colors.dart';
import 'package:skeleton_test/config/constants/app_text_styles.dart';

class AppTextTheme {
  final Color defaultColor;

  const AppTextTheme({
    required this.defaultColor,
  });

  Color get _textColor => defaultColor;

  TextStyle get s14w400 => AppTextStyles.s14w400.copyWith(color: _textColor);
  TextStyle get s24w500 => AppTextStyles.s24w500.copyWith(color: _textColor);
}

class LightAppTextTheme extends AppTextTheme {
  const LightAppTextTheme() : super(defaultColor: AppColors.dark);
}
