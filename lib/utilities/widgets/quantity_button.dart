import 'package:flutter/material.dart';
import 'package:machine_test_app/utilities/colors.dart';
import 'package:machine_test_app/utilities/styles.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      height: 30,
      width: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () {}, child: const Icon(Icons.remove, color: kwhite)),
          const Text(
            '0',
            style: whiteText,
          ),
          GestureDetector(
              onTap: () {}, child: const Icon(Icons.add, color: kwhite))
        ],
      ),
    );
  }
}
