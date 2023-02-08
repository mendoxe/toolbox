import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooolbox/model/creditor.dart';
import 'package:tooolbox/model/debtor.dart';
import 'package:tooolbox/model/enums.dart';
import 'package:tooolbox/screens/calculate/control/calculate_state.dart';
import 'package:tooolbox/screens/cash_exchange/control/cash_exchange_provider.dart';
import 'package:tooolbox/screens/cash_exchange/control/cash_exchange_state.dart';
import 'package:tooolbox/model/exchange_user.dart';

final calculateProvider =
    StateNotifierProvider<CalculateNotifier, CalculateState>((ref) {
  CashExchangeNotifier notifier = ref.watch(cashExchangeProvider.notifier);
  return CalculateNotifier(notifier);
});

class CalculateNotifier extends StateNotifier<CalculateState> {
  CalculateNotifier(this._exchangeNotifier) : super(CalculateState.initial());

  final CashExchangeNotifier _exchangeNotifier;

  void calculate() {
    state = state.copyWith(loadingState: LoadingState.loading);

    CashExchangeState cashState = _exchangeNotifier.state;
    double fairAmount = cashState.amount / cashState.users.length;
    List<ExchangeUser> creditors = [];
    List<ExchangeUser> debtors = [];
    List<Debtor> finalList = [];

    for (ExchangeUser user in cashState.users) {
      if (user.moneyAmount < fairAmount) {
        debtors.add(user);
      } else {
        creditors.add(user);
      }
    }
    creditors.sort((a, b) => a.moneyAmount - b.moneyAmount);
    debtors.sort((a, b) => a.moneyAmount - b.moneyAmount);

    for (ExchangeUser debtUser in debtors) {
      double amountOwed = fairAmount - debtUser.moneyAmount;
      List<Creditor> users = [];

      List<ExchangeUser> toRemoveCreditors = [];

      for (ExchangeUser creditor in creditors) {
        if (amountOwed == 0) break;

        double amountToGet = creditor.moneyAmount - fairAmount;

        if (amountOwed > amountToGet) {
          amountOwed -= amountToGet;
          users.add(Creditor(name: creditor.name, amount: amountToGet));
          toRemoveCreditors.add(creditor);
        } else {
          users.add(Creditor(name: creditor.name, amount: amountOwed));
          creditor = creditor.copyWith(
            moneyAmount: (creditor.moneyAmount - amountOwed).floor(),
          );
          amountOwed = 0;
        }
      }
      for (var creditor in toRemoveCreditors) {
        creditors.remove(creditor);
      }

      finalList.add(Debtor(name: debtUser.name, creditors: users));
    }

    log(finalList.toString());

    state =
        state.copyWith(debtors: finalList, loadingState: LoadingState.loaded);
  }
}
