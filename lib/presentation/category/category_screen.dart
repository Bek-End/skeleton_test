import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skeleton_test/config/constants/assets.dart';
import 'package:skeleton_test/config/theme/app_theme.dart';
import 'package:skeleton_test/presentation/category/category_controller.dart';
import 'package:skeleton_test/presentation/widgets/category_item.dart';
import 'package:skeleton_test/presentation/widgets/loading.dart';
import 'package:skeleton_test/presentation/widgets/my_category.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryController controller;
  const CategoryScreen({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final appTheme = AppTheme.of(context);
    final textTheme = appTheme.textTheme;
    final colorsScheme = appTheme.colorsScheme;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 45, 24, 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.myCode,
                  style: textTheme.s24w500,
                ),
                Badge(
                  position: BadgePosition.topEnd(top: 2, end: -1),
                  child: SvgPicture.asset(
                    Assets.icons.bell,
                    width: 24,
                    height: 27,
                    color: colorsScheme.dark,
                  ),
                )
              ],
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 30),
            child: _Categories(controller: controller),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 7),
              child: Scrollbar(
                thickness: 4,
                child: FutureBuilder<List<String>>(
                  future: controller.init(),
                  builder: (_, snap) {
                    if (snap.hasData && snap.data!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: controller.myCategories.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, index) {
                          return MyCategoryItem(
                            title: controller.myCategories[index],
                            buttonColor: colorsScheme.buttonColor[index],
                            iconBgColor: colorsScheme.buttonIconBgColor[index],
                          );
                        },
                      );
                    }
                    return const Loading();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  final CategoryController controller;
  const _Categories({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return ListView.builder(
          itemCount: controller.categories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CategoryItem(
                title: controller.categories[index],
                isSelected: controller.selectedCategory == index,
                onTap: () => controller.changeSelectedCategory(index),
              ),
            );
          },
        );
      },
    );
  }
}
