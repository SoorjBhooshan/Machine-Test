import 'package:flutter/material.dart';
import 'package:machine_test_app/model/food_model.dart';
import 'package:machine_test_app/services/remote_services.dart';

class FoodController extends ChangeNotifier {
  List<FoodModel>? foodModel = [];
  List<CategoryDish> categoryDishes = [];
  List<String> tableMenuList = [];

  getFoodModel() async {
    foodModel = await RemoteService().getCategoryDish();
  }

  getTableMenuList() async {
    await getFoodModel();

    for (int i = 0; i < foodModel![0].tableMenuList.length; i++) {
      tableMenuList.add(foodModel![0].tableMenuList[i].menuCategory);
    }
  }

  getProductList() async {
    await getFoodModel();
    for (int i = 0; i < foodModel![0].tableMenuList.length; i++) {
      categoryDishes.add(foodModel![0].tableMenuList[0].categoryDishes[i]);
    }
  }
}
