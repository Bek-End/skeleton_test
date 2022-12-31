import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:skeleton_test/config/theme/app_theme.dart';
import 'package:skeleton_test/config/theme/themes.dart';
import 'package:skeleton_test/core/di/app_locator.dart';
import 'package:skeleton_test/presentation/category/category_controller.dart';
import 'package:skeleton_test/presentation/home_page.dart';

GlobalKey<NavigatorState> globalKey = GlobalKey();

void _init() {
  AppLocator.init();
  CategoryController(GetIt.I.get()).init();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: globalKey,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: Themes.lightTheme,
      builder: (_, child) => AppThemeWidget(child: child!),
      home: const HomePage(),
    );
  }
}
