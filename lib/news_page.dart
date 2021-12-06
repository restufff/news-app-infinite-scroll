// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_infinite_scroll/controllers/posts_controller.dart';
import 'package:news_app_infinite_scroll/widget/news_card_widget.dart';

class NewsPage extends StatefulWidget {
  int categoryID;
  bool isReload;
  int totalRecord;

  NewsPage({
    this.categoryID,
    this.isReload,
    this.totalRecord,
  });

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final PostsController postsController = Get.put(PostsController());
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  ScrollController _scrollController = new ScrollController();
  int _page = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      if (this.widget.isReload) {
        await postsController.fetchPosts(
          categoryId: this.widget.categoryID,
          pageNumber: 1,
          totalRecords: this.widget.totalRecord,
        );
      }
    });

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        await postsController.fetchPosts(
          pageNumber: ++_page,
          totalRecords: this.widget.totalRecord,
          categoryId: this.widget.categoryID,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return newsList();
  }

  Widget newsList() {
    return Container(
      child: Obx(() {
        if (postsController.isLoading.value)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          // ignore: curly_braces_in_flow_control_structures
          return RefreshIndicator(
            key: refreshKey,
            onRefresh: () =>
                postsController.fetchPosts(categoryId: this.widget.categoryID),
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: postsController.postsList.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                if ((index == postsController.postsList.length - 1) &&
                    postsController.postsList.length <
                        this.widget.totalRecord) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return NewsCardWidget(
                  model: postsController.postsList[index],
                );
              },
            ),
          );
      }),
    );
  }
}
