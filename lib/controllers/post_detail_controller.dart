import 'package:get/get.dart';
import 'package:news_app_infinite_scroll/model/news_model.dart';
import 'package:news_app_infinite_scroll/services/api_services.dart';

class PostDetailsController extends GetxController {
  var isLoading = true.obs;
  var postModel = NewsModel().obs;

  Future<void> fetchPostDetail(
    int postId,
  ) async {
    try {
      isLoading(true);

      var postDetail = await APIService.fetchPostDetails(postId);

      if (postDetail != null) {
        postModel.value = postDetail;
      }
    } finally {
      isLoading(false);
    }
  }
}
