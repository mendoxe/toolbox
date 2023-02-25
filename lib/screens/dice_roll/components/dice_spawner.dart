import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooolbox/screens/dice_roll/components/dice_widget.dart';
import 'package:tooolbox/screens/dice_roll/control/dice_roll_provider.dart';

class DiceSpawner extends ConsumerWidget {
  const DiceSpawner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int diceAmount = ref.watch(diceRollProvider).diceAmount;

    if (diceAmount == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          DiceWidget(position: 0),
          DiceWidget(position: 1),
        ],
      ).animate().fadeIn().scale();
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.infinity,
      child: GridView.builder(
        itemCount: diceAmount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: diceAmount == 1 ? 1 : 2,
        ),
        itemBuilder: (context, index) {
          return DiceWidget(position: index).animate().fadeIn().scale();
        },
      ),
    );
  }
}
