import 'package:skeleton_test/core/show_error.dart';
import 'package:skeleton_test/data/repositories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<List<String>> getCategories() async {
    try {
      final categories = _fakeMyCategory;
      await Future.delayed(const Duration(seconds: 1));
      return categories;
    } catch (e) {
      showError(e.toString());
      rethrow;
    }
  }
}

final _fakeMyCategory = <String>[
  'Моя машина',
  'Мой ребенок',
  'Моя квартира',
  'Мой кошелек',
  'Мой телефон',
];
