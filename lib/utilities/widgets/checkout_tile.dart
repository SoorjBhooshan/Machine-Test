import 'package:flutter/material.dart';
import 'package:machine_test_app/utilities/colors.dart';
import 'package:machine_test_app/utilities/widgets/quantity_button.dart';

class CheckoutTile extends StatefulWidget {
  const CheckoutTile({Key? key}) : super(key: key);

  @override
  State<CheckoutTile> createState() => _CheckoutTileState();
}

class _CheckoutTileState extends State<CheckoutTile> {
  @override
  Widget build(BuildContext context) {
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
                  children: const [
                    Text('Product Name'),
                    QuantityButton(color: kgreenColor),
                  ],
                ),
                const Text('INR 20.00'),
                const Text('112 calories'),
              ],
            ),
            trailing: const Text('INR 20.00'),
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
  }
}
