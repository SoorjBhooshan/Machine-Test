import 'package:flutter/material.dart';
import 'package:machine_test_app/controller/food_controller.dart';
import 'package:machine_test_app/utilities/colors.dart';
import 'package:machine_test_app/utilities/constants.dart';
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
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: foodController
                                  .foodModel![0]
                                  .tableMenuList[widget.currentIndex]
                                  .categoryDishes[widget.number]
                                  .dishAvailability
                              ? Colors.green
                              : Colors.red)),
                  height: 22,
                  width: 22,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: foodController
                            .foodModel![0]
                            .tableMenuList[widget.currentIndex]
                            .categoryDishes[widget.number]
                            .dishAvailability
                        ? Colors.green
                        : Colors.red,
                  )),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodController
                        .foodModel![0]
                        .tableMenuList[widget.currentIndex]
                        .categoryDishes[widget.number]
                        .dishName,
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "INR ${foodController.foodModel![0].tableMenuList[widget.currentIndex].categoryDishes[widget.number].dishPrice}"),
                      Text(foodController
                          .foodModel![0]
                          .tableMenuList[widget.currentIndex]
                          .categoryDishes[widget.number]
                          .dishCalories
                          .toString())
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(foodController
                      .foodModel![0]
                      .tableMenuList[widget.currentIndex]
                      .categoryDishes[widget.number]
                      .dishDescription
                      .toString(),style: const TextStyle(color:kgrey),),
                  const SizedBox(
                    height: 10,
                  ),
                  QuantityButton(
                    color: kgreenColor,
                    currentIndex: widget.currentIndex,
                    number: widget.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(foodController
                          .foodModel![0]
                          .tableMenuList[widget.currentIndex]
                          .categoryDishes[widget.number]
                          .addonCat!
                          .isNotEmpty
                      ? customizationAvailableText
                      : '')
                ],
              ),
              trailing: Image.asset('images/mutta.jpg'),
              // child: Image.network(foodController
              //     .foodModel![0]
              //     .tableMenuList[widget.currentIndex]
              //     .categoryDishes[widget.number]
              //     .dishImage),
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
