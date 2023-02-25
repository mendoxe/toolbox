import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../control/dice_roll_provider.dart';

class DiceAmountPopupButton extends ConsumerWidget {
  const DiceAmountPopupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<int>(
      icon: const FaIcon(FontAwesomeIcons.arrowDownShortWide),
      iconSize: 16,
      padding: const EdgeInsets.only(right: 16),
      initialValue: 1,
      onSelected: (int value) {
        ref.read(diceRollProvider.notifier).changeDiceAmount(value);
      },
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            child: Text('1 Dice'),
            value: 1,
          ),
          const PopupMenuItem(
            child: Text('2 Dice'),
            value: 2,
          ),
          const PopupMenuItem(
            child: Text('3 Dice'),
            value: 3,
          ),
          const PopupMenuItem(
            child: Text('4 Dice'),
            value: 4,
          ),
        ];
      },
    );
  }
}
