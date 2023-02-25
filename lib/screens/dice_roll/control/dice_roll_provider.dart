import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooolbox/screens/dice_roll/control/dice_roll_state.dart';

final diceRollProvider =
    StateNotifierProvider<DiceRollNotifier, DiceRollState>((ref) {
  return DiceRollNotifier();
});

class DiceRollNotifier extends StateNotifier<DiceRollState> {
  DiceRollNotifier() : super(DiceRollState.initial());

  void changeDiceAmount(int amount) {
    state = DiceRollState.initial(amount);
  }

  Future<void> rollDice() async {
    if (state.isRolling) return;
    state = state.copyWith(isRolling: true);
    for (var i = 1; i < 7; i++) {
      state = state
          .copyWith(values: [for (var j = 0; j < state.diceAmount; j++) i]);
      await Future.delayed(const Duration(milliseconds: 200));
    }

    List<int> newValues = [];
    for (var i = 0; i < state.diceAmount; i++) {
      newValues.add(Random().nextInt(6) + 1);
    }
    state = state.copyWith(values: newValues, isRolling: false);
  }
}
