import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:skeleton_test/config/constants/assets.dart';
import 'package:skeleton_test/config/theme/app_theme.dart';
import 'package:skeleton_test/presentation/screens/settings_screen.dart';
import 'package:skeleton_test/presentation/category/category_screen.dart';
import 'package:skeleton_test/presentation/screens/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  static final List<Widget> _widgetOptions = <Widget>[
    const SettingsScreen(),
    CategoryScreen(controller: GetIt.I.get()),
    const ProfileScreen(),
  ];

  final List<String> _icons = <String>[
    Assets.icons.settings,
    Assets.icons.qr,
    Assets.icons.profile,
  ];

  final List<String> _labels = <String>[
    'Settings',
    'Мои коды',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: colorsScheme.dark,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(3, (index) {
            return _BottomItemBar(
              isSelected: _selectedIndex == index,
              icon: _icons[index],
              label: _labels[index],
              onTap: () => setState(() => _selectedIndex = index),
            );
          }),
        ),
      ),
    );
  }
}

class _BottomItemBar extends StatelessWidget {
  final bool isSelected;
  final String icon;
  final String label;
  final VoidCallback onTap;
  const _BottomItemBar({
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final color =
        isSelected ? appTheme.colorsScheme.dark : appTheme.colorsScheme.light;
    final style = appTheme.textTheme.s24w500.copyWith(fontSize: 14);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: isSelected ? const EdgeInsets.all(14) : null,
        decoration: BoxDecoration(
          color: isSelected ? appTheme.colorsScheme.selectedColor : null,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: 20,
              height: 20,
              color: color,
            ),
            if (isSelected) ...[
              const SizedBox(width: 11),
              Text(
                label,
                style: style,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
