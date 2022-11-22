import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.color,
      required this.text,
      required this.path,
      required this.height,
      required this.width});

  final Color color;
  final String text;
  final double height;
  final double width;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), color: color),
      height: height,
      width: width,
      child: Row(
        
        children: [
          const SizedBox(width: 20,),
          Image.asset(path),
          const SizedBox(width: 80,),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
