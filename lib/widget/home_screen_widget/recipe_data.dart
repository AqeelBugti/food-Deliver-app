import 'package:fast_food/model/category_model.dart';
import 'package:fast_food/provider/categories_provider.dart';
import 'package:fast_food/provider/more_category.dart';
import 'package:fast_food/screen/category.dart';
import 'package:fast_food/widget/home_screen_widget/category_calling_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoriesProvider richessProvider =
        Provider.of<CategoriesProvider>(context);
    MoreCategory myProvider = Provider.of<MoreCategory>(context);
    List<CategoryModel> richessData = richessProvider.getRecipeList;

    return Row(
      children: richessData
          .map(
            (e) => GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Category(
                      name: e.categoryTitle,
                      list: myProvider.getsingleFoodList,
                    ),
                  ),
                );
              },
              child: CategoryCallingData(
                image: e.categoryImage,
                title: e.categoryTitle,
              ),
            ),
          )
          .toList(),
    );
  }
}
