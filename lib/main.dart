// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_infinite_scroll/home_page.dart';

void main() {
  runApp(UnasBerita());
}

class UnasBerita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portal Berita UNAS',
      home: HomePage(),
    );
  }
}
