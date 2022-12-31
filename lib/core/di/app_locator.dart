import 'package:get_it/get_it.dart';
import 'package:skeleton_test/data/repositories/category_repository.dart';
import 'package:skeleton_test/data/repositories/category_repository_impl.dart';
import 'package:skeleton_test/presentation/category/category_controller.dart';
import 'package:skeleton_test/presentation/category/category_service.dart';

class AppLocator {
  static void init() {
    final getIt = GetIt.I;

    getIt.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
    getIt.registerLazySingleton(() => CategoryService());
    getIt.registerLazySingleton(() => CategoryController(getIt.get()));
  }

  static Future<void> dispose() async {
    return GetIt.I.reset();
  }
}
