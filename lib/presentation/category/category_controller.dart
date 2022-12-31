import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:skeleton_test/data/repositories/category_repository.dart';
import 'package:skeleton_test/presentation/category/category_service.dart';

class CategoryController with ChangeNotifier {
  final CategoryService _categoryService;
  CategoryController(this._categoryService);

  final CategoryRepository repository = GetIt.I.get();

  int _selectedCategory = 0;
  int get selectedCategory => _selectedCategory;

  final List<String> _categories = _fakeCategory;
  List<String> get categories => _categories;

  late List<String> _myCategories = [];
  List<String> get myCategories => _myCategories;

  Future<List<String>> init() async {
    _myCategories = await repository.getCategories();
    _categoryService.setCategories(_myCategories);
    return _myCategories;
  }

  Future<void> changeSelectedCategory(int index) async {
    if (index == _categories.length - 1) addCategory();
    if (index == _selectedCategory) return;
    _selectedCategory = index;
    _categoryService.changeSelectedCategory(index);
    notifyListeners();
  }

  Future<void> addCategory() async {
    final length = _fakeCategory.length;
    _fakeCategory.insert(length - 1, 'NewCategory${length - 3}');
    notifyListeners();
  }
}

final _fakeCategory = <String>[
  'Все коды',
  'Избранное',
  'Машина',
  'Добавить +',
];
