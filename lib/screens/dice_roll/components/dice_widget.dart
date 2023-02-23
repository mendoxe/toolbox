import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooolbox/screens/dice_roll/control/dice_roll_provider.dart';

import 'dice_generator.dart';

class DiceWidget extends ConsumerWidget {
  const DiceWidget({
    super.key,
    required this.position,
    this.size = 160,
  });

  final double size;
  final int position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int diceAmount = ref.watch(diceRollProvider).diceAmount;

    // TODO: probably some kind of gridView to display current amount of dice

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child:
            DiceGenerator(amount: ref.watch(diceRollProvider).values[position]),
      ),
    );
  }
}
