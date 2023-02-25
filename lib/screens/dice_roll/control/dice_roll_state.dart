// ignore_for_file: public_member_api_docs, sort_constructors_first
class DiceRollState {
  final bool isRolling;
  final int diceAmount;
  final List<int> values;

  DiceRollState({
    required this.isRolling,
    required this.diceAmount,
    required this.values,
  });

  factory DiceRollState.initial([int amount = 1]) {
    return DiceRollState(
      isRolling: false,
      diceAmount: amount,
      values: [for (var i = 0; i < amount; i++) 6],
    );
  }

  DiceRollState copyWith({
    bool? isRolling,
    int? diceAmount,
    List<int>? values,
  }) {
    return DiceRollState(
      isRolling: isRolling ?? this.isRolling,
      diceAmount: diceAmount ?? this.diceAmount,
      values: values ?? this.values,
    );
  }
}
