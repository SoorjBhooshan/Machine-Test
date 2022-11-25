import 'package:flutter/material.dart';
import 'package:machine_test_app/model/food_model.dart';
import 'package:machine_test_app/services/remote_services.dart';
import 'package:machine_test_app/utilities/widgets/home_tile.dart';

class FoodController extends ChangeNotifier {
  List<FoodModel>? foodModel = [];
  List<CategoryDish> categoryDishes = [];
  List<Widget> tableMenuList = [];
  int? selectedIndex;
  List<ListView> totalList = [];
  List<CategoryDish> cart = [];
  int quantity = 0;

  void increaseQuantity() {
    quantity++;
    notifyListeners();
  }

  void decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
    }

    notifyListeners();
  }

  getFoodModel() async {
    foodModel = await RemoteService().getCategoryDish();
    notifyListeners();
  }

  void getTableMenuList() {
    for (int i = 0; i < foodModel![0].tableMenuList.length; i++) {
      tableMenuList.add(Tab(text: foodModel![0].tableMenuList[i].menuCategory));
    }

    notifyListeners();
  }

  getProductList() async {
    for (int i = 0; i < foodModel![0].tableMenuList.length; i++) {
      categoryDishes.add(foodModel![0].tableMenuList[0].categoryDishes[i]);
    }
  }

  getTotalList() {
    for (int i = 0; i < foodModel![0].tableMenuList.length; i++) {
      totalList.add(ListView.builder(
        itemCount: foodModel![0].tableMenuList[i].categoryDishes.length,
        itemBuilder: (context, index) {
          return HomeTile(currentIndex: i, number: index);
        },
      ));
    }
  }
}
