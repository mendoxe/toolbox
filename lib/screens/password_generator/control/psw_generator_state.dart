import 'package:flutter/cupertino.dart';

enum PswInput {
  lowercase("abcdefghijklmnopqrstuvwxyz"),
  uppercase("ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
  numbers("0123456789"),
  symbols(".,/()[]{};:@#!?%*");

  final String chars;

  const PswInput(this.chars);
}

class PswGeneratorState {
  final List<PswInput> inputs;
  final int pswLength;
  final String password;
  final TextEditingController textEditingController;

  PswGeneratorState({
    required this.inputs,
    required this.pswLength,
    required this.password,
    required this.textEditingController,
  });

  factory PswGeneratorState.initial() {
    return PswGeneratorState(
      inputs: [
        PswInput.lowercase,
        PswInput.uppercase,
        PswInput.numbers,
        PswInput.symbols
      ],
      pswLength: 12,
      password: '42',
      textEditingController: TextEditingController(),
    );
  }

  PswGeneratorState copyWith({
    List<PswInput>? inputs,
    int? pswLength,
    String? password,
    TextEditingController? textEditingController,
  }) {
    return PswGeneratorState(
      inputs: inputs ?? this.inputs,
      pswLength: pswLength ?? this.pswLength,
      password: password ?? this.password,
      textEditingController:
          textEditingController ?? this.textEditingController,
    );
  }
}
