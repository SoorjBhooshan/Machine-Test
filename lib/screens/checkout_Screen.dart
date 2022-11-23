import 'package:flutter/material.dart';
import 'package:machine_test_app/utilities/constants.dart';
import 'package:machine_test_app/utilities/widgets/checkout_tile.dart';

class CheckoutScreen extends StatefulWidget {
 const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green[900],
                        borderRadius: BorderRadius.circular(8)
                      ),
                      height: 40,
                      
                      child: const Center(child: Text('2 Dishes - 2 Items')),
                    ),
                  ),
                  CheckoutTile(),
                  CheckoutTile(),
                  CheckoutTile(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(totalAmountText,style: TextStyle(fontSize: 20),),
                        Text('65',style: TextStyle(color: Colors.red,fontSize: 20),),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                         color: Colors.green[900], borderRadius: BorderRadius.circular(25)),
                  child: const Center(child:  Text('Place Your Order')),
                ),
                const SizedBox(height: 10,)
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
