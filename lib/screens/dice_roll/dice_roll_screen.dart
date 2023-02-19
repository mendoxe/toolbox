import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tooolbox/screens/components/buttons/default_button.dart';
import 'components/dice_widget.dart';

class DiceRollScreen extends StatefulWidget {
  const DiceRollScreen({Key? key}) : super(key: key);

  static const String routeName = "/diceRoll";

  @override
  State<DiceRollScreen> createState() => _DiceRollScreenState();
}

class _DiceRollScreenState extends State<DiceRollScreen> {
  int amount = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: "Dice Roll",
          child: Text("Dice Roll"),
        ),
        actions: const [
          // DropdownButton(items: items, onChanged: onChanged)
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            DiceWidget(amount: amount),
            const Spacer(),
            DefaultButton(
              label: 'Roll',
              onTap: rollDice,
              icon: FontAwesomeIcons.dice,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Future<void> rollDice() async {
    for (var i = 1; i < 7; i++) {
      setState(() {
        amount = i;
      });
      await Future.delayed(const Duration(milliseconds: 200));
    }
    setState(() {
      amount = Random().nextInt(6);
    });
  }
}
