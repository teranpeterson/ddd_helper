import 'package:flutter/material.dart';

class Domino extends StatelessWidget {
  final bool invert;
  final int top;
  final int bottom;

  const Domino(
      {super.key,
      required this.invert,
      required this.top,
      required this.bottom});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 50,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: invert ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$top',
              style: TextStyle(
                  fontSize: 20, color: invert ? Colors.white : Colors.black),
            ),
            Divider(
              indent: 6,
              endIndent: 6,
              thickness: 1,
              color: invert ? Colors.white : Colors.black,
            ),
            Text(
              '$bottom',
              style: TextStyle(
                  fontSize: 20, color: invert ? Colors.white : Colors.black),
            ),
          ]),
    );
  }
}
