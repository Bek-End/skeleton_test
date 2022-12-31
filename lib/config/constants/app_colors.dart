import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  static const List<Color> buttonIconBgColor = <Color>[
    Color(0xFF4D8EFF),
    Color(0xFFCDC1FF),
    Color(0xFF7AE582),
    Color(0xFF81CCF2),
    Color(0xFF77EDD9),
  ];

  static List<Color> buttonColor = <Color>[
    const Color(0xFF4385F6).withOpacity(0.2),
    const Color(0xFFCDC1FF).withOpacity(0.2),
    const Color(0xFFE4F9E4),
    const Color(0xFF71BBFF).withOpacity(0.2),
    const Color(0xFF77EDD9).withOpacity(0.2),
  ];

  static const Color notifColor = Color(0xFFFF002E);
  static const Color selectedColor = Color(0xFFCDC1FF);
  static const Color borderColor = Color(0xFFEBEBEB);
  static const Color dark = Color(0xFF211F1F);
  static const Color light = Color(0xFFFFFEFC);
}
