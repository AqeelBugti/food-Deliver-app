import 'package:fast_food/widget/home_screen_widget/category.dart';
import 'package:flutter/material.dart';

class CategoryCallingData extends StatelessWidget {
  final String image;
  final String title;

  CategoryCallingData({@required this.image, @required this.title});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
    children: [
      CategoryWidget(
        image: image,
        title: title,
      ),
    ],
        ),
      );
  }
}
