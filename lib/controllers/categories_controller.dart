import 'package:get/get.dart';
import 'package:news_app_infinite_scroll/model/category_model.dart';
import 'package:news_app_infinite_scroll/services/api_services.dart';

class CategoriesContoller extends GetxController {
  // ignore: deprecated_member_use
  var categoriesList = List<CategoryModel>().obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      var categories = await APIService.fetchCategories();
      if (categories.length > 0) {
        categoriesList.clear();
        categoriesList.addAll(categories);
      }
    } finally {}
  }
}
