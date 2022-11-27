import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:machine_test_app/controller/food_controller.dart';
import 'package:machine_test_app/screens/home_screen.dart';
import 'package:machine_test_app/utilities/constants.dart';
import 'package:machine_test_app/utilities/widgets/checkout_tile.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    if (Provider.of<FoodController>(context, listen: false).cart.isNotEmpty) {
      Provider.of<FoodController>(context, listen: false).cart.clear();
    }
    Provider.of<FoodController>(context, listen: false).totalQuantity = 0;
    Provider.of<FoodController>(context, listen: false).totalAmount = 0;
    Provider.of<FoodController>(context, listen: false).getCartProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<FoodController>(context, listen: true).cart.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('No records')),
      );
    } else {
      return Consumer<FoodController>(
          builder: (context, foodController, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Order Summary')),
          backgroundColor: Colors.grey[100],
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green[900],
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              '${foodController.cart.length} Dishes - ${foodController.totalQuantity} Items',
                              style: const TextStyle(fontSize: 20),
                            ),
                          )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: foodController.cart.length,
                              itemBuilder: (context, index) {
                                return CheckoutTile(number: index);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                totalAmountText,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                Provider.of<FoodController>(context,
                                        listen: true)
                                    .totalAmount
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 20),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "Order Successfully Placed",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          foodController.clearCartDetails();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green[900],
                              borderRadius: BorderRadius.circular(25)),
                          child: const Center(
                              child: Text(
                            'Place Your Order',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      });
    }
  }
}
