import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final bool invert;
  final int number;

  const Dice({super.key, required this.invert, required this.number});

  @override
  Widget build(BuildContext context) {
    Color pipColor = invert ? Colors.white : Colors.black;
    Color bkgColor = invert ? Colors.black : Colors.white;
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: invert ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _Pip(
                  color: number == 2 ||
                          number == 3 ||
                          number == 4 ||
                          number == 5 ||
                          number == 6
                      ? pipColor
                      : bkgColor,
                ),
                _Pip(
                  color: bkgColor,
                ),
                _Pip(
                  color: number == 4 || number == 5 || number == 6
                      ? pipColor
                      : bkgColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _Pip(
                  color: number == 6 ? pipColor : bkgColor,
                ),
                _Pip(
                  color: number == 1 || number == 3 || number == 5
                      ? pipColor
                      : bkgColor,
                ),
                _Pip(
                  color: number == 6 ? pipColor : bkgColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _Pip(
                  color: number == 4 || number == 5 || number == 6
                      ? pipColor
                      : bkgColor,
                ),
                _Pip(
                  color: bkgColor,
                ),
                _Pip(
                  color: number == 2 ||
                          number == 3 ||
                          number == 4 ||
                          number == 5 ||
                          number == 6
                      ? pipColor
                      : bkgColor,
                ),
              ],
            ),
          ],
        ));
  }
}

class _Pip extends StatelessWidget {
  final Color color;

  const _Pip({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      color: color,
    );
  }
}
