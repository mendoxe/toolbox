import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooolbox/screens/cash_exchange/control/cash_exchange_provider.dart';

import '../../../model/exchange_user.dart';

class ExchangeChip extends ConsumerWidget {
  const ExchangeChip({
    Key? key,
    required this.user,
  }) : super(key: key);

  final ExchangeUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Chip(
        padding: const EdgeInsets.all(10),
        label: Text(
          '${user.name}  ~  ${user.moneyAmount}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        onDeleted: () {
          ref.read(cashExchangeProvider.notifier).removeUser(user);
        },
      ),
    );
  }
}
