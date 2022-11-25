import 'package:flutter/material.dart';
import 'package:machine_test_app/controller/food_controller.dart';
import 'package:machine_test_app/utilities/widgets/quantity_button.dart';
import 'package:provider/provider.dart';

class HomeTile extends StatefulWidget {
  HomeTile({Key? key, required this.number, required this.currentIndex})
      : super(key: key);
  int number;
  int currentIndex;
  @override
  State<HomeTile> createState() => _HomeTileState();
}

class _HomeTileState extends State<HomeTile> {
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
                      BoxDecoration(border: Border.all(color: Colors.green)),
                  height: 22,
                  width: 22,
                  child: const CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.green,
                  )),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(foodController
                      .foodModel![0]
                      .tableMenuList[widget.currentIndex]
                      .categoryDishes[widget.number]
                      .dishName),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(foodController
                          .foodModel![0]
                          .tableMenuList[widget.currentIndex]
                          .categoryDishes[widget.number]
                          .dishPrice
                          .toString()),
                      Text(foodController
                          .foodModel![0]
                          .tableMenuList[widget.currentIndex]
                          .categoryDishes[widget.number]
                          .dishCalories
                          .toString())
                    ],
                  ),
                  Text(foodController
                      .foodModel![0]
                      .tableMenuList[widget.currentIndex]
                      .categoryDishes[widget.number]
                      .dishDescription
                      .toString()),
                  const QuantityButton(color: Colors.green),
                  const Text('Customization Available')
                ],
              ),
              // trailing: SizedBox(
              //     height: 100,
              //     width: 100,
              //     child: Image.network(foodController
              //         .foodModel![0]
              //         .tableMenuList[widget.currentIndex]
              //         .categoryDishes[widget.number]
              //         .dishImage)),
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
