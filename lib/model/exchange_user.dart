class ExchangeUser {
  final String name;
  final int moneyAmount;

  ExchangeUser(this.name, this.moneyAmount);

  ExchangeUser copyWith({
    String? name,
    int? moneyAmount,
  }) {
    return ExchangeUser(
      name ?? this.name,
      moneyAmount ?? this.moneyAmount,
    );
  }
}
