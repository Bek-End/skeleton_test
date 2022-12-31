import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_test/config/constants/assets.dart';
import 'package:skeleton_test/config/theme/app_theme.dart';

class MyCategoryItem extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color iconBgColor;
  const MyCategoryItem({
    required this.title,
    required this.buttonColor,
    required this.iconBgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    final style = appTheme.textTheme.s14w400.copyWith(fontSize: 18);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 21, vertical: 7),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              Assets.icons.qr,
              width: 18,
              height: 18,
              color: colorsScheme.dark,
            ),
          ),
          const SizedBox(width: 23),
          Text(
            title,
            style: style,
          ),
        ],
      ),
    );
  }
}
