import 'package:tooolbox/model/exchange_user.dart';

class CashExchangeState {
  final List<ExchangeUser> users;
  final int amount;

  CashExchangeState({
    required this.users,
    required this.amount,
  });

  factory CashExchangeState.initial() {
    return CashExchangeState(users: [], amount: 0);
  }

  CashExchangeState copyWith({
    List<ExchangeUser>? users,
    int? amount,
  }) {
    return CashExchangeState(
      users: users ?? this.users,
      amount: amount ?? this.amount,
    );
  }
}
