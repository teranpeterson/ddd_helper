import 'dart:math';

import 'package:ddd_helper/widgets/dice.dart';
import 'package:ddd_helper/widgets/domino.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class DiceScreen extends StatefulWidget {
  static const diceSpacing = 15.0;

  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int dice1 = 1;
  int dice2 = 2;
  int dice3 = 3;
  int dice4 = 4;
  int dice5 = 5;

  List<int> dice = [1, 2, 3, 4, 5];
  Set<Tuple2<int, int>> whiteDominos = {};
  Set<Tuple2<int, int>> blackDominos = {};

  _rollDice() {
    var random = Random();
    whiteDominos.clear();
    blackDominos.clear();
    setState(() {
      dice1 = random.nextInt(6) + 1;
      dice2 = random.nextInt(6) + 1;
      dice3 = random.nextInt(6) + 1;
      dice4 = random.nextInt(6) + 1;
      dice5 = random.nextInt(6) + 1;

      whiteDominos.add(Tuple2(dice1 + dice2, dice3 + dice4));
      whiteDominos.add(Tuple2(dice1 + dice3, dice2 + dice4));
      whiteDominos.add(Tuple2(dice1 + dice4, dice2 + dice3));

      blackDominos.add(Tuple2(dice5 + dice1, dice2 + dice3));
      blackDominos.add(Tuple2(dice5 + dice1, dice2 + dice4));
      blackDominos.add(Tuple2(dice5 + dice1, dice3 + dice4));

      blackDominos.add(Tuple2(dice5 + dice2, dice1 + dice3));
      blackDominos.add(Tuple2(dice5 + dice2, dice1 + dice4));
      blackDominos.add(Tuple2(dice5 + dice2, dice3 + dice4));

      blackDominos.add(Tuple2(dice5 + dice3, dice1 + dice2));
      blackDominos.add(Tuple2(dice5 + dice3, dice1 + dice4));
      blackDominos.add(Tuple2(dice5 + dice3, dice2 + dice4));

      blackDominos.add(Tuple2(dice5 + dice4, dice1 + dice2));
      blackDominos.add(Tuple2(dice5 + dice4, dice1 + dice3));
      blackDominos.add(Tuple2(dice5 + dice4, dice2 + dice3));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onDoubleTap: _rollDice,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...whiteDominos
                    .map((domino) => Domino(
                          invert: false,
                          top: domino.item1,
                          bottom: domino.item2,
                        ))
                    .toList(),
              ],
            ),
            const SizedBox(
              height: DiceScreen.diceSpacing,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Dice(
                  invert: false,
                  number: dice1,
                ),
                const SizedBox(
                  width: DiceScreen.diceSpacing,
                ),
                Dice(
                  invert: false,
                  number: dice2,
                ),
              ],
            ),
            const SizedBox(
              height: DiceScreen.diceSpacing,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Dice(
                  invert: false,
                  number: dice3,
                ),
                const SizedBox(
                  width: DiceScreen.diceSpacing,
                ),
                Dice(
                  invert: false,
                  number: dice4,
                ),
              ],
            ),
            const SizedBox(
              height: DiceScreen.diceSpacing,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Dice(
                  invert: true,
                  number: dice5,
                ),
              ],
            ),
            const SizedBox(
              height: DiceScreen.diceSpacing,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                ...blackDominos
                    .map((domino) => Domino(
                          invert: true,
                          top: domino.item1,
                          bottom: domino.item2,
                        ))
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
