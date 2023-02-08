import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'encoder_state.dart';

final encoderNotifierProvider =
    StateNotifierProvider<EncoderNotifier, EncoderState>((ref) {
  return EncoderNotifier();
});

class EncoderNotifier extends StateNotifier<EncoderState> {
  EncoderNotifier() : super(EncoderState.initial());

  void encryptText(String text) {
    if (text.isEmpty) return;
    Runes chars = text.runes;

    state = state.copyWith(
      encodedText: String.fromCharCodes(chars.map((char) => char + 1).toList()),
    );
  }

  void decryptText(String text) {
    if (text.isEmpty) return;
    Runes chars = text.runes;

    state = state.copyWith(
      encodedText: String.fromCharCodes(chars.map((char) => char - 1).toList()),
    );
  }

  void reset() {
    state = EncoderState.initial();
  }
}
