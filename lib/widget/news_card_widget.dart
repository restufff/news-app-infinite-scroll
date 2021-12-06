// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_infinite_scroll/model/news_model.dart';
import 'package:news_app_infinite_scroll/news_detail.dart';
import 'package:news_app_infinite_scroll/utilities/layout_utility.dart';

class NewsCardWidget extends StatelessWidget {
  final NewsModel model;
  NewsCardWidget({this.model});

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 5,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(
          16.0,
        ),
      ),
      child: new InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => NewsDetail()),
          // );
          Get.to(NewsDetail(), arguments: model.id);
        },
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                new ClipRRect(
                  child: Image.network(
                    model.imageURL,
                    scale: 1.0,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: new Radius.circular(16.0),
                    topRight: new Radius.circular(16.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      model.categoryName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            new Padding(
              padding: new EdgeInsets.all(15),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text(
                    model.title,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  new SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LayoutUtils.iconText(
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.green,
                        ),
                        Text(
                          model.postedDate,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
