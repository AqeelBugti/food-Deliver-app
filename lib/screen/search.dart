import 'package:fast_food/model/single_food.dart';
import 'package:fast_food/provider/more_category.dart';
import 'package:fast_food/screen/detail_screen.dart';
import 'package:fast_food/widget/home_screen_widget/bottom_part.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate<MoreCategory> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    MoreCategory searchBar = Provider.of<MoreCategory>(context, listen: false);
    List<SingleFood> _searchFoodList = searchBar.search(query);
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        padding: EdgeInsets.only(top: 10),
        children: _searchFoodList
            .map<Widget>(
              (e) => BottomPart(
                whenPress: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (coontext) => DetailScreen(
                        image: e.foodimage,
                        price: e.foodPrice,
                        title: e.foodTitle,
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    MoreCategory searchBar = Provider.of<MoreCategory>(context, listen: false);
    List<SingleFood> _searchFoodList = searchBar.search(query);
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        padding: EdgeInsets.only(top: 10),
        children: _searchFoodList
            .map<Widget>(
              (e) => BottomPart(
                whenPress: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (coontext) => DetailScreen(
                        image: e.foodimage,
                        price: e.foodPrice,
                        title: e.foodTitle,
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
    );
  }
}
