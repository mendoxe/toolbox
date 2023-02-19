import 'package:flutter/material.dart';

import 'dice_dot.dart';

class DiceGenerator extends StatelessWidget {
  const DiceGenerator({Key? key, required this.amount}) : super(key: key);

  final int amount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: DiceDot(opacity: topLeft),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: DiceDot(opacity: topRight),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: DiceDot(opacity: bottomLeft),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: DiceDot(opacity: bottomRight),
        ),
        Positioned(
          left: 0,
          top: 33,
          child: DiceDot(opacity: centerLeft),
        ),
        Positioned(
          right: 0,
          top: 33,
          child: DiceDot(opacity: centerRight),
        ),
        Positioned(
          right: 33,
          top: 33,
          child: DiceDot(opacity: center),
        ),
      ],
    );
  }

  double get topLeft => amount == 1 ? 0 : 1;
  double get topRight => amount > 3 ? 1 : 0;
  double get bottomLeft => amount > 3 ? 1 : 0;
  double get bottomRight => amount > 1 ? 1 : 0;
  double get centerLeft => amount == 6 ? 1 : 0;
  double get centerRight => amount == 6 ? 1 : 0;
  double get center => amount % 2 == 1 ? 1 : 0;
}
