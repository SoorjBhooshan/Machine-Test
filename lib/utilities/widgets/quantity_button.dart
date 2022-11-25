import 'package:flutter/material.dart';
import 'package:machine_test_app/controller/food_controller.dart';
import 'package:machine_test_app/utilities/colors.dart';
import 'package:machine_test_app/utilities/styles.dart';
import 'package:provider/provider.dart';

class QuantityButton extends StatelessWidget {
  QuantityButton(
      {Key? key,
      required this.color,
      required this.number,
      required this.currentIndex})
      : super(key: key);

  final Color color;
  int number;
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodController>(builder: (context, foodController, child) {
      return Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(30)),
        height: 30,
        width: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {
                  foodController.decreaseQuantity(currentIndex, number);
                },
                child: const Icon(Icons.remove, color: kwhite)),
            Text(
              foodController.foodModel![0].tableMenuList[currentIndex]
                  .categoryDishes[number].quantity
                  .toString(),
              style: whiteText,
            ),
            GestureDetector(
                onTap: () {
                  foodController.increaseQuantity(currentIndex, number);
                },
                child: const Icon(Icons.add, color: kwhite))
          ],
        ),
      );
    });
  }
}
