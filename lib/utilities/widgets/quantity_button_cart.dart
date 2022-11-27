import 'package:flutter/material.dart';
import 'package:machine_test_app/controller/food_controller.dart';
import 'package:machine_test_app/utilities/colors.dart';
import 'package:machine_test_app/utilities/styles.dart';
import 'package:provider/provider.dart';

class QuantityButtonCart extends StatelessWidget {
  QuantityButtonCart(
      {Key? key,
      required this.color,
      required this.number,
      })
      : super(key: key);

  final Color color;
  int number;


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
                  foodController.decreaseQuantityCart(number);
                },
                child: const Icon(Icons.remove, color: kwhite)),
            Text(
              foodController.cart
                  [number].quantity
                  .toString(),
              style: whiteText,
            ),
            GestureDetector(
                onTap: () {
                  foodController.increaseQuantityCart(number);
                },
                child: const Icon(Icons.add, color: kwhite))
          ],
        ),
      );
    });
  }
}
