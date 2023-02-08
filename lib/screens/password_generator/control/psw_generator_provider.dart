import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooolbox/screens/password_generator/control/psw_generator_state.dart';

final pswGeneratorProvider =
    StateNotifierProvider<PswGeneratorNotifier, PswGeneratorState>((ref) {
  return PswGeneratorNotifier();
});

class PswGeneratorNotifier extends StateNotifier<PswGeneratorState> {
  PswGeneratorNotifier() : super(PswGeneratorState.initial());

  void addInputModifier(PswInput inputModifier) {
    state = state.copyWith(inputs: state.inputs..add(inputModifier));
  }

  void removeInputModifier(PswInput inputModifier) {
    state = state.copyWith(inputs: state.inputs..remove(inputModifier));
  }

  void changePswLength(int length) {
    state = state.copyWith(pswLength: length);
  }

  void setTextController(TextEditingController textEditingController) {
    state = state.copyWith(textEditingController: textEditingController);
  }

  String generatePassword() {
    List<String> chars = [];

    for (PswInput input in state.inputs) {
      chars.addAll(input.chars.characters);
    }

    if (chars.isEmpty) {
      state = state.copyWith(password: '42');
      state.textEditingController.text = '42';
      return '42';
    }
    List<String> password = [];
    for (var i = 0; i < state.pswLength; i++) {
      int position = Random().nextInt(chars.length - 1);
      password.add(chars[position]);
    }

    String psw = password.join();
    state = state.copyWith(password: psw);
    state.textEditingController.text = psw;

    return psw;
  }

  @override
  void dispose() {
    state.textEditingController.dispose();
    super.dispose();
  }
}
