// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:news_app_infinite_scroll/controllers/post_detail_controller.dart';
import 'package:news_app_infinite_scroll/utilities/layout_utility.dart';

class NewsDetail extends StatelessWidget {
  final PostDetailsController newsDetaillController =
      Get.put(PostDetailsController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await newsDetaillController.fetchPostDetail(Get.arguments);
    });
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // flexibleSpace: FlexibleSpaceBar(
            //   background: Image.network(
            //     "https://picsum.photos/500/500",
            //     fit: BoxFit.cover,
            //   ),
            // ),
            flexibleSpace: FlexibleSpaceBar(
              background: backgroundImage(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            expandedHeight: 250,
          ),
          SliverFillRemaining(child: Obx(() {
            if (newsDetaillController.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return newsDetailSection();
            }
          }))
        ],
      ),
    );
  }

  Widget backgroundImage() {
    return Obx(() {
      if (newsDetaillController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Image.network(
          newsDetaillController.postModel.value.imageURL,
          fit: BoxFit.cover,
        );
      }
    });
  }

  Widget newsDetailSection() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          row1(),
          LayoutUtils.iconText(
              Icon(
                Icons.calendar_today_outlined,
                color: Colors.green,
              ),
              Text(newsDetaillController.postModel.value.postedDate)),
          SizedBox(height: 15),
          Text(
            newsDetaillController.postModel.value.title,
            style: TextStyle(
              fontSize: 19,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            child: Divider(color: Colors.green, thickness: 3),
            width: 100,
          ),
          Expanded(
              child: Html(
            style: {"p": Style(color: Colors.black, fontSize: FontSize.large)},
            data: newsDetaillController.postModel.value.postContent,
          ))
        ],
      ),
    );
  }

  Widget row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              newsDetaillController.postModel.value.categoryName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            children: [
              IconButton(icon: Icon(Feather.moon), onPressed: null),
            ],
          ),
        )
      ],
    );
  }
}
