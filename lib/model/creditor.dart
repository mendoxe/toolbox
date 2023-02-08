class Creditor {
  final String name;
  final double amount;
  Creditor({
    required this.name,
    required this.amount,
  });

  Creditor copyWith({
    String? name,
    double? amount,
  }) {
    return Creditor(
      name: name ?? this.name,
      amount: amount ?? this.amount,
    );
  }

  @override
  String toString() => 'Creditor(name: $name, amount: $amount)';
}
