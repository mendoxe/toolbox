class DiceRollState {
  final int diceAmount;
  final List<int> values;

  DiceRollState({required this.diceAmount, required this.values});

  factory DiceRollState.initial([int amount = 1]) {
    return DiceRollState(
        diceAmount: amount, values: [for (var i = 0; i < amount; i++) 6]);
  }

  DiceRollState copyWith({
    int? diceAmount,
    List<int>? values,
  }) {
    return DiceRollState(
      diceAmount: diceAmount ?? this.diceAmount,
      values: values ?? this.values,
    );
  }
}
