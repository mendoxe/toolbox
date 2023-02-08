import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooolbox/screens/cash_exchange/control/cash_exchange_state.dart';
import 'package:tooolbox/model/exchange_user.dart';

final cashExchangeProvider =
    StateNotifierProvider<CashExchangeNotifier, CashExchangeState>((ref) {
  return CashExchangeNotifier();
});

class CashExchangeNotifier extends StateNotifier<CashExchangeState> {
  CashExchangeNotifier() : super(CashExchangeState.initial());

  void addUser({required String name, required int amount}) {
    ExchangeUser user = ExchangeUser(name, amount);
    state = state.copyWith(
      users: state.users..add(user),
      amount: state.amount + amount,
    );
  }

  void removeUser(ExchangeUser user) {
    state = state.copyWith(
      users: state.users..remove(user),
      amount: state.amount - user.moneyAmount,
    );
  }

  void clear() {
    state = CashExchangeState.initial();
  }
}
