import 'dart:convert';
import 'package:intl/intl.dart';
import '../config.dart';

List<NewsModel> postsFromJson(String str) =>
    List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

NewsModel postDetailsFromJson(String str) =>
    NewsModel.fromJson(json.decode(str));

class NewsModel {
  int id;
  String title;
  String imageURL;
  String postedDate;
  int categoryId;
  String categoryName;
  String postContent;

  NewsModel(
      {this.id,
      this.title,
      this.imageURL,
      this.postedDate,
      this.categoryId,
      this.categoryName,
      this.postContent});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageURL = json['image_url'];
    postedDate = DateFormat("dd-MM-yyyy").format(
      DateTime.parse(
        json['post_date'],
      ),
    );
    categoryName = json['category_name'];
    if (json['post_content'] != null) {
      postContent = json['post_content'];
    }
  }
}
