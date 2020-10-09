import 'package:fast_food/provider/categories_provider.dart';
import 'package:fast_food/provider/more_category.dart';
import 'package:fast_food/widget/home_screen_widget/body_calling_data.dart';
import 'package:fast_food/widget/home_screen_widget/home_app_bar.dart';
import 'package:fast_food/widget/home_screen_widget/my_drawer_calling_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ////////////////////   Catgories      /////////////////////////

    CategoriesProvider categoriesProvider =
        Provider.of<CategoriesProvider>(context);
    categoriesProvider.fetchpizzaData();
    categoriesProvider.fetchBurgerData();
    categoriesProvider.fetchRecipeData();
    categoriesProvider.fetchDrinkData();
    categoriesProvider.fetchAllData();
    //////moreCategory
    MoreCategory moreCategory = Provider.of<MoreCategory>(context);
    moreCategory.fetchBugerCagtegories();
    moreCategory.fetchPizzaCagtegories();
    moreCategory.fetchDrinkCagtegories();
    moreCategory.fetchSingleFoodData();
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawerCallingData(),
      appBar: homeAppBar(context: context),
      body: BodyCallingData(),
    );
  }
}
