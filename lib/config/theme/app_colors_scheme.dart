import 'package:flutter/material.dart';
import 'package:skeleton_test/config/constants/app_colors.dart';

abstract class AppColorsScheme {
  const AppColorsScheme._();

  List<Color> get buttonColor;
  List<Color> get buttonIconBgColor;
  Color get white;
  Color get black;
  Color get notifColor;
  Color get selectedColor;
  Color get borderColor;
  Color get dark;
  Color get light;
}

class LightAppColorsScheme implements AppColorsScheme {
  const LightAppColorsScheme();

  @override
  List<Color> get buttonColor => AppColors.buttonColor;
  @override
  List<Color> get buttonIconBgColor => AppColors.buttonIconBgColor;
  @override
  Color get white => Colors.white;
  @override
  Color get black => Colors.black;
  @override
  Color get notifColor => AppColors.notifColor;
  @override
  Color get selectedColor => AppColors.selectedColor;
  @override
  Color get borderColor => AppColors.borderColor;
  @override
  Color get dark => AppColors.dark;
  @override
  Color get light => AppColors.light;
}
