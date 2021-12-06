import 'package:http/http.dart' as http;
import 'package:news_app_infinite_scroll/model/news_model.dart';
import '../config.dart';
import 'package:news_app_infinite_scroll/model/category_model.dart';

class APIService {
  static var client = http.Client();

  static Future<List<CategoryModel>> fetchCategories() async {
    var response = await client.get(
      Config.apiURL + Config.categoryURL,
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return categoryFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<NewsModel>> fetchPost(
    int pageNumber,
    int categoryId,
  ) async {
    var url = Config.apiURL +
        Config.postsURL +
        categoryId.toString() +
        "&page_no=" +
        pageNumber.toString();
    var response = await client.get(url);
    print(Config.apiURL + Config.postsURL);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postsFromJson(jsonString);
    }
  }

  static Future<NewsModel> fetchPostDetails(
    int postId,
  ) async {
    var response = await client.get(
      Config.apiURL + Config.postDetailURL + postId.toString(),
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return postDetailsFromJson(jsonString);
    }

    return null;
  }
}
