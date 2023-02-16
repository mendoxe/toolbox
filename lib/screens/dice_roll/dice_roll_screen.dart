import 'package:flutter/material.dart';

class DiceRollScreen extends StatelessWidget {
  const DiceRollScreen({Key? key}) : super(key: key);

  static const String routeName = "/diceRoll";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: "Dice Roll",
          child: Text("Dice Roll"),
        ),
      ),
    );
  }
}
