import 'package:fast_food/widget/home_screen_widget/star_widget.dart';
import 'package:fast_food/widget/home_screen_widget/title_price_widget.dart';
import 'package:flutter/material.dart';

class BottomPart extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final Function whenPress;
  BottomPart(
      {@required this.whenPress,
      @required this.image,
      @required this.price,
      @required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenPress,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).textTheme.button.color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 60,
                    backgroundImage: NetworkImage(image),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitlePriceWidget(
                      price: price,
                      title: title,
                    ),
                    StartWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
