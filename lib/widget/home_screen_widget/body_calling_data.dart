import 'package:fast_food/widget/home_screen_widget/all_food_data.dart';
import 'package:fast_food/widget/home_screen_widget/bottom_part_calling_data.dart';
import 'package:fast_food/widget/home_screen_widget/search_bar_widget.dart';
import 'package:fast_food/widget/home_screen_widget/top_part_text.dart';
import 'package:flutter/material.dart';

class BodyCallingData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: ListView(
        children: [
          Container(
            height: 800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             TopPartText(),
                SearchBarWidget(),
                AllFoodData(),
                BottomPartCallingData(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
