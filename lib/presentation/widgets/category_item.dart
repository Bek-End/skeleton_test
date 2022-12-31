import 'package:flutter/material.dart';
import 'package:skeleton_test/config/theme/app_theme.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const CategoryItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    final style = appTheme.textTheme.s14w400.copyWith(
      color: isSelected ? colorsScheme.white : colorsScheme.black,
    );

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? colorsScheme.dark : colorsScheme.light,
          borderRadius: BorderRadius.circular(41),
          border: Border.all(
            color: isSelected ? colorsScheme.dark : colorsScheme.borderColor,
            width: 2,
          ),
        ),
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}
