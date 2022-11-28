import 'package:flutter/material.dart';
import 'package:machine_test_app/model/food_model.dart';
import 'package:machine_test_app/services/remote_services.dart';
import 'package:machine_test_app/utilities/widgets/home_tile.dart';

class FoodController extends ChangeNotifier {
  List<FoodModel>? foodModel = [];
  List<CategoryDish> categoryDishes = [];
  List<Widget> tabMenuList = [];
  List<ListView> totalList = [];
  List<CategoryDish> cart = [];

  int totalQuantity = 0;
  double totalAmount = 0;

  int currentIndex = 0;
  int num = 0;

  void clearAllLists() {
    categoryDishes = [];
    tabMenuList = [];
    totalList = [];
    cart = [];

    notifyListeners();
  }

  void clearCartDetails() {
    totalQuantity = 0;
    totalAmount = 0;
    cart = [];
  }

  void increaseQuantity(int currentIndex, int number) {
    foodModel![0].tableMenuList[currentIndex].categoryDishes[number].quantity++;
    getCartProducts();
    notifyListeners();
  }

  void decreaseQuantity(int currentIndex, int number) {
    if (foodModel![0]
            .tableMenuList[currentIndex]
            .categoryDishes[number]
            .quantity >
        0) {
      foodModel![0]
          .tableMenuList[currentIndex]
          .categoryDishes[number]
          .quantity--;
      getCartProducts();
    }

    notifyListeners();
  }

  void increaseQuantityCart(int number) {
    for (int i = 0; i < foodModel![0].tableMenuList.length; i++) {
      for (int j = 0;
          j < foodModel![0].tableMenuList[i].categoryDishes.length;
          j++) {
        if (foodModel![0].tableMenuList[i].categoryDishes[j].dishId ==
            cart[number].dishId) {
          increaseQuantity(i, j);
        }
      }
    }

    notifyListeners();
  }

  void decreaseQuantityCart(int number) {
    if (cart.isNotEmpty) {
      if (cart[number].quantity > 1) {
        for (int i = 0; i < foodModel![0].tableMenuList.length; i++) {
          for (int j = 0;
              j < foodModel![0].tableMenuList[i].categoryDishes.length;
              j++) {
            if (foodModel![0].tableMenuList[i].categoryDishes[j].dishId ==
                cart[number].dishId) {
              decreaseQuantity(i, j);
              if (cart[number].quantity == 1) {
                currentIndex = i;
                num = j;
              }
            }
          }
        }
      } else {
        cart.removeAt(number);

        decreaseQuantity(currentIndex, num);
      }
    } else {
      return;
    }

    notifyListeners();
  }

  getFoodModel() async {
    foodModel = await RemoteService().getCategoryDish();
    notifyListeners();
  }

  void getTabMenuList() {
    tabMenuList = [];

    for (int i = 0; i < foodModel![0].tableMenuList.length; i++) {
      tabMenuList.add(Tab(text: foodModel![0].tableMenuList[i].menuCategory));
    }

    notifyListeners();
  }

  getProductList() {
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

  setQuantitytoZero() {
    for (int i = 0; i < foodModel![0].tableMenuList.length; i++) {
      for (int j = 0;
          j < foodModel![0].tableMenuList[i].categoryDishes.length;
          j++) {
        foodModel![0].tableMenuList[i].categoryDishes[j].quantity = 0;
      }
    }
    
  }

  getCartProducts() {
    clearCartDetails();

    for (int i = 0; i < foodModel![0].tableMenuList.length; i++) {
      for (int j = 0;
          j < foodModel![0].tableMenuList[i].categoryDishes.length;
          j++) {
        if (foodModel![0].tableMenuList[i].categoryDishes[j].quantity > 0) {
          cart.add(foodModel![0].tableMenuList[i].categoryDishes[j]);

          totalQuantity +=
              foodModel![0].tableMenuList[i].categoryDishes[j].quantity;

          totalAmount +=
              foodModel![0].tableMenuList[i].categoryDishes[j].dishPrice *
                  foodModel![0].tableMenuList[i].categoryDishes[j].quantity;
        }
      }
    }
  }
}
