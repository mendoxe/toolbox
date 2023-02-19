// ignore_for_file: public_member_api_docs, sort_constructors_first

class DiceRollState {
  final int diceAmount;
  final int firstDice;
  final int secondDice;
  final int thirdDice;
  final int fourthDice;

  DiceRollState({
    required this.diceAmount,
    required this.firstDice,
    required this.secondDice,
    required this.thirdDice,
    required this.fourthDice,
  });

  factory DiceRollState.initial() {
    return DiceRollState(
      diceAmount: 1,
      firstDice: 0,
      secondDice: 0,
      thirdDice: 0,
      fourthDice: 0,
    );
  }

  DiceRollState copyWith({
    int? diceAmount,
    int? firstDice,
    int? secondDice,
    int? thirdDice,
    int? fourthDice,
  }) {
    return DiceRollState(
      diceAmount: diceAmount ?? this.diceAmount,
      firstDice: firstDice ?? this.firstDice,
      secondDice: secondDice ?? this.secondDice,
      thirdDice: thirdDice ?? this.thirdDice,
      fourthDice: fourthDice ?? this.fourthDice,
    );
  }
}
