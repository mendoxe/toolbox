import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tooolbox/screens/components/buttons/default_button.dart';

import 'components/dice_generator.dart';

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

  void rollDice() {
    int count = 0;
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (count < 7) {
        setState(() {
          amount = Random().nextInt(6);
        });
        count++;
      } else {
        timer.cancel();
      }
    });
  }
}

class DiceWidget extends StatelessWidget {
  const DiceWidget({
    super.key,
    required this.amount,
    this.size = 160,
  });

  final int amount;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: DiceGenerator(amount: amount),
      ),
    );
  }
}
