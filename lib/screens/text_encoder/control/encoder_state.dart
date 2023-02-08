class EncoderState {
  final String encodedText;

  EncoderState({required this.encodedText});

  factory EncoderState.initial() {
    return EncoderState(encodedText: '');
  }

  EncoderState copyWith({
    String? encodedText,
  }) {
    return EncoderState(
      encodedText: encodedText ?? this.encodedText,
    );
  }
}
