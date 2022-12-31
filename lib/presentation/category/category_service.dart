class CategoryService {
  List<String> categories = <String>[];
  int selectedCategoryIndex = 0;

  void setCategories(List<String> categories) => this.categories = categories;

  void changeSelectedCategory(int index) => selectedCategoryIndex = index;
}
