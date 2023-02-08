import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'random_pick_state.dart';

final randomPickProvider =
    StateNotifierProvider<RandomPickNotifier, RandomPickState>((ref) {
  return RandomPickNotifier();
});

class RandomPickNotifier extends StateNotifier<RandomPickState> {
  RandomPickNotifier() : super(RandomPickState.initial());

  void addValue(String value) {
    state = state.copyWith(values: state.values..add(value));
  }

  void removeValue(String value) {
    state = state.copyWith(values: state.values..remove(value));
  }

  bool pickRandomValue() {
    if (state.values.isEmpty) return false;

    int position = Random().nextInt(state.values.length);

    state = state.copyWith(selectedValue: state.values[position]);

    return true;
  }

  void resetValues() {
    state = RandomPickState.initial();
  }
}
