import 'package:get/get.dart';
import 'package:news_app_infinite_scroll/model/news_model.dart';
import 'package:news_app_infinite_scroll/services/api_services.dart';

class PostsController extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var postsList = List<NewsModel>().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchPosts({
    int categoryId = 1,
    int pageNumber = 0,
    int totalRecords = 0,
  }) async {
    try {
      isLoading(true);
      if (postsList.length == 0 || pageNumber == 0) {
        isLoading(true);
        postsList.clear();
      }

      if (postsList.length < totalRecords) {
        var posts = await APIService.fetchPost(pageNumber, categoryId);

        if (posts != null) {
          postsList.addAll(posts);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
