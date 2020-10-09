import 'package:fast_food/model/category_model.dart';
import 'package:fast_food/provider/categories_provider.dart';
import 'package:fast_food/provider/more_category.dart';
import 'package:fast_food/screen/category.dart';
import 'package:fast_food/widget/home_screen_widget/burger_data.dart';
import 'package:fast_food/widget/home_screen_widget/category_calling_data.dart';
import 'package:fast_food/widget/home_screen_widget/drink_data.dart';
import 'package:fast_food/widget/home_screen_widget/pizza_data.dart';
import 'package:fast_food/widget/home_screen_widget/recipe_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllFoodData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MoreCategory moreCategory=Provider.of<MoreCategory>(context);
    CategoriesProvider allfoodList = Provider.of<CategoriesProvider>(context);

    List<CategoryModel> allFood = allfoodList.getallList;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: allFood.map((e) {
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Category(
                        list: moreCategory.getsingleFoodList,
                        name: e.categoryTitle,
                      ),
                    ),
                  );
                },
                child: CategoryCallingData(
                  image: e.categoryImage,
                  title: e.categoryTitle,
                ),
              ),
              BurgerData(),
              RecipeData(),
              PizzaData(),
              DrinkData(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
