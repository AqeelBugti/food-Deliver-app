import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_food/model/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoriesProvider with ChangeNotifier {
  CategoryModel categoryModel;
  //////////////  for Pizza            /////////
  List<CategoryModel> pizzaList = [];

  Future<void> fetchpizzaData() async {
    List<CategoryModel> newPizzaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('xk1J3KDgAfcu7h3mbfuQ')
        .collection('Pizza')
        .get();

    querySnapshot.docs.forEach(
      (element) {
        String pizzaImage = element.data()['image'];
        String pizzaTitle = element.data()['title'];
        categoryModel = CategoryModel(
          categoryImage: pizzaImage,
          categoryTitle: pizzaTitle,
        );
        newPizzaList.add(categoryModel);
      },
    );
    pizzaList = newPizzaList;

    notifyListeners();
  }

  List<CategoryModel> get getpizzaList => List.from(pizzaList);
  ////////////////  For Burger     ////////////////////
  List<CategoryModel> burgerList = [];
  Future<void> fetchBurgerData() async {
    List<CategoryModel> burgerNewList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('xk1J3KDgAfcu7h3mbfuQ')
        .collection('Burger')
        .get();
    querySnapshot.docs.forEach((element) {
      String burgerImage = element.data()['image'];
      String burgerTitle = element.data()['title'];
      categoryModel = CategoryModel(
        categoryImage: burgerImage,
        categoryTitle: burgerTitle,
      );
      burgerNewList.add(categoryModel);
    });
    burgerList = burgerNewList;
    notifyListeners();
  }

  List<CategoryModel> get getburgerList => List.from(burgerList);

  ////////////////  For Drinks     ////////////////////

  List<CategoryModel> drinkList = [];

  Future<void> fetchDrinkData() async {
    List<CategoryModel> drinkNewList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('xk1J3KDgAfcu7h3mbfuQ')
        .collection('Drinks')
        .get();
    querySnapshot.docs.forEach((element) {
      String drinkImage = element.data()['image'];
      String drinkTitle = element.data()['title'];

      categoryModel = CategoryModel(
        categoryImage: drinkImage,
        categoryTitle: drinkTitle,
      );
      drinkNewList.add(categoryModel);
    });
    drinkList = drinkNewList;
    notifyListeners();
  }

  List<CategoryModel> get getdrinkList => List.from(drinkList);
  //////////////////////// for Richess         /////////////////////////////

  List<CategoryModel> recipeList = [];

  Future<void> fetchRecipeData() async {
    List<CategoryModel> recipeNewList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('xk1J3KDgAfcu7h3mbfuQ')
        .collection('Recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      String recipeImage = element.data()['image'];
      String recipeTitle = element.data()['title'];

      categoryModel = CategoryModel(
        categoryImage: recipeImage,
        categoryTitle: recipeTitle,
      );
      recipeNewList.add(categoryModel);
    });

    recipeList = recipeNewList;
    notifyListeners();
  }

  List<CategoryModel> get getRecipeList => List.from(recipeList);
//////////////// For All

  List<CategoryModel> allList = [];

  Future<void> fetchAllData() async {
    List<CategoryModel> allNewList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('xk1J3KDgAfcu7h3mbfuQ')
        .collection('All')
        .get();
    querySnapshot.docs.forEach((element) {
      String drinkImage = element.data()['image'];
      String drinkTitle = element.data()['title'];

      categoryModel = CategoryModel(
        categoryImage: drinkImage,
        categoryTitle: drinkTitle,
      );
      allNewList.add(categoryModel);
    });

    allList = allNewList;
    notifyListeners();
  }

  List<CategoryModel> get getallList => List.from(allList);
}
