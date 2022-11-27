import 'package:flutter/material.dart';
import 'package:machine_test_app/controller/food_controller.dart';
import 'package:machine_test_app/utilities/colors.dart';
import 'package:machine_test_app/utilities/widgets/quantity_button.dart';
import 'package:machine_test_app/utilities/widgets/quantity_button_cart.dart';
import 'package:provider/provider.dart';

class CheckoutTile extends StatefulWidget {
  CheckoutTile({Key? key, required this.number}) : super(key: key);
  int number;
  @override
  State<CheckoutTile> createState() => _CheckoutTileState();
}

class _CheckoutTileState extends State<CheckoutTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodController>(builder: (context, foodController, child) {
      return SizedBox(
        child: Column(
          children: [
            ListTile(
              leading: Container(
                  padding: const EdgeInsets.all(3),
                  decoration:
                      BoxDecoration(border: Border.all(color: kgreenColor)),
                  height: 22,
                  width: 22,
                  child: const CircleAvatar(
                    radius: 5,
                    backgroundColor: kgreenColor,
                  )),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                              foodController.cart[widget.number].dishName)),
                      QuantityButtonCart(
                          color: kgreenColor, number: widget.number),
                    ],
                  ),
                  Text("INR ${foodController.cart[widget.number].dishPrice}"),
                  Text(foodController.cart[widget.number].dishCalories
                      .toString()),
                ],
              ),
              trailing:
                  Text(foodController.cart[widget.number].dishPrice.toString()),
            ),
            const SizedBox(
              width: double.infinity,
              child: Divider(
                thickness: 1,
              ),
            )
          ],
        ),
      );
    });
  }
}
