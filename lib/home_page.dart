// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_infinite_scroll/controllers/categories_controller.dart';
import 'package:news_app_infinite_scroll/news_page.dart';
import 'package:news_app_infinite_scroll/widget/news_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Widget> tabs = [];

  final CategoriesContoller categoriesContoller =
      Get.put(CategoriesContoller());

  @override
  void initState() {
    // tabs.add(tab("Berita"));
    // tabs.add(tab("Kegiatan"));
    // tabs.add(tab("Kegiatan"));
    // tabs.add(tab("Kegiatan"));
    // tabs.add(tab("Kegiatan"));
    // tabs.add(tab("Kegiatan"));
    // tabs.add(tab("Kegiatan"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Obx(() {
        return DefaultTabController(
          length: categoriesContoller.categoriesList.length,
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Portal Berita UNAS",
                  style: TextStyle(color: Color(0xFF000000)),
                ),
                elevation: 0,
                backgroundColor: Colors.white,
                bottom: TabBar(
                  tabs: categoriesContoller.categoriesList
                      .map((model) => tab(model.categoryName))
                      .toList(),
                  isScrollable: true,
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.green,
                ),
                actions: <Widget>[
                  Icon(Icons.search, color: Colors.black),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.notifications, color: Colors.black),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              body: TabBarView(
                children: categoriesContoller.categoriesList.map((model) {
                  return NewsPage(
                    categoryID: model.categoryId,
                    isReload: true,
                    totalRecord: model.count,
                  );
                }).toList(),
              )),
        );
      }),
    );
  }

  Widget tab(String tabName) {
    return Tab(
      text: tabName,
    );
  }
}
