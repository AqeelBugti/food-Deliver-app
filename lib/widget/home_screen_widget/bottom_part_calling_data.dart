import 'package:fast_food/model/single_food.dart';
import 'package:fast_food/provider/more_category.dart';
import 'package:fast_food/screen/detail_screen.dart';
import 'package:fast_food/widget/home_screen_widget/bottom_part.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomPartCallingData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MoreCategory myProvider = Provider.of<MoreCategory>(context);
    myProvider.fetchSingleFoodData();

    List<SingleFood> singleFood = myProvider.getsingleFoodList;
    return Container(
      height: 510,
      child: GridView.builder(
        shrinkWrap: false,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => BottomPart(
          whenPress: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  image: singleFood[index].foodimage,
                  price: singleFood[index].foodPrice,
                  title: singleFood[index].foodTitle,
                ),
              ),
            );
          },
          image: singleFood[index].foodimage,
          price: singleFood[index].foodPrice,
          title: singleFood[index].foodTitle,
        ),
        itemCount: singleFood.length,
      ),
    );
  }
}
