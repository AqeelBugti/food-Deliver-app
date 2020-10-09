import 'package:fast_food/model/single_food.dart';
import 'package:fast_food/provider/more_category.dart';
import 'package:fast_food/screen/detail_screen.dart';
import 'package:fast_food/screen/home_screen.dart';
import 'package:fast_food/screen/search.dart';
import 'package:fast_food/widget/home_screen_widget/bottom_part.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  final List<SingleFood> list;
  final String name;
  Category({@required this.list, @required this.name});

  @override
  Widget build(BuildContext context) {
    MoreCategory searchProvider = Provider.of<MoreCategory>(context);

    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText2.color,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 25,
            color: Theme.of(context).textTheme.bodyText2.color,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Theme.of(context).textTheme.bodyText2.color,
              size: 30,
            ),
            onPressed: () {
              searchProvider.getSearchList(list: list);
              showSearch(
                context: context,
                delegate: Search(),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: list
              .map(
                (e) => BottomPart(
                  whenPress: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          image: e.foodimage,
                          title: e.foodTitle,
                          price: e.foodPrice,
                        ),
                      ),
                    );
                  },
                  image: e.foodimage,
                  price: e.foodPrice,
                  title: e.foodTitle,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
