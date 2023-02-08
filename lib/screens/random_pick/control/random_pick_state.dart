class RandomPickState {
  List<String> values;
  String selectedValue;
  RandomPickState({
    required this.values,
    required this.selectedValue,
  });

  factory RandomPickState.initial() {
    return RandomPickState(
      values: [],
      selectedValue: '',
    );
  }

  RandomPickState copyWith({
    List<String>? values,
    String? selectedValue,
  }) {
    return RandomPickState(
      values: values ?? this.values,
      selectedValue: selectedValue ?? this.selectedValue,
    );
  }
}
