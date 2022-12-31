import 'package:flutter/material.dart';
import 'package:skeleton_test/config/constants/app_colors.dart';

import 'app_text_theme.dart';

abstract class Themes {
  const Themes._();

  static ThemeData get lightTheme {
    const textTheme = LightAppTextTheme();

    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.light,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        titleTextStyle: textTheme.s24w500,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.dark,
      ),
    );
  }
}
