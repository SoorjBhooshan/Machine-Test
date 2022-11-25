import 'package:flutter/material.dart';
import 'package:machine_test_app/controller/food_controller.dart';
import 'package:machine_test_app/utilities/colors.dart';
import 'package:machine_test_app/utilities/styles.dart';
import 'package:provider/provider.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({Key? key, required this.color}) : super(key: key);

  final Color color;

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
                  foodController.decreaseQuantity();
                },
                child: const Icon(Icons.remove, color: kwhite)),
            Text(
              foodController.quantity.toString(),
              style: whiteText,
            ),
            GestureDetector(
                onTap: () {
                  foodController.increaseQuantity();
                },
                child: const Icon(Icons.add, color: kwhite))
          ],
        ),
      );
    });
  }
}
