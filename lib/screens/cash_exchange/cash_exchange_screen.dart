import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tooolbox/screens/calculate/calculate_screen.dart';
import 'package:tooolbox/screens/calculate/control/calculate_provider.dart';
import 'package:tooolbox/screens/cash_exchange/control/cash_exchange_provider.dart';
import 'package:tooolbox/screens/components/buttons/default_button.dart';
import 'package:tooolbox/screens/components/custom_back_button.dart';
import 'package:tooolbox/screens/components/custom_snackbar.dart';

import 'components/exchange_chip.dart';
import 'components/money_text_field.dart';
import 'components/name_text_field.dart';

class CashExchangeScreen extends ConsumerStatefulWidget {
  const CashExchangeScreen({Key? key}) : super(key: key);

  static const String routeName = "/cashExchange";

  @override
  ConsumerState<CashExchangeScreen> createState() => _CashExchangeScreenState();
}

class _CashExchangeScreenState extends ConsumerState<CashExchangeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _moneyController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _moneyController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Hero(
          tag: "Cash Exchange",
          child: Text("Cash Exchange"),
        ),
        actions: [
          TextButton.icon(
            onPressed: clear,
            style: TextButton.styleFrom(backgroundColor: Colors.transparent),
            icon: const Icon(Icons.clear_all),
            label: const Text('clear'),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Total amount of money',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Text(
              ref.watch(cashExchangeProvider).amount.toString(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 60,
            child: ListView.builder(
              itemCount: ref.watch(cashExchangeProvider).users.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ExchangeChip(
                  user: ref.watch(cashExchangeProvider).users[index],
                ).animate().fadeIn().scale();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Name',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          NameTextField(controller: _nameController),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Money',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          MoneyTextField(controller: _moneyController),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (ref.watch(cashExchangeProvider).users.length > 1)
                TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.transparent),
                  onPressed: calculate,
                  child: const Text(
                    'Calculate',
                    style: TextStyle(fontSize: 16),
                  ),
                ).animate().fadeIn().scale().then().shake(),
              DefaultButton(
                label: 'Submit',
                onTap: submit,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ]
            .animate(interval: 50.ms)
            .fadeIn(duration: 150.ms, curve: Curves.ease)
            .slideX(),
      ),
    );
  }

  void submit() {
    log('_${_nameController.text} + ${_moneyController.text}_');
    if (_nameController.text.isEmpty || _moneyController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar("Name and money are required".toSnackBar());
      return;
    }
    if (int.tryParse(_moneyController.text) == null) return;

    ref.read(cashExchangeProvider.notifier).addUser(
          name: _nameController.text,
          amount: int.parse(_moneyController.text),
        );

    _nameController.clear();
    _moneyController.clear();
  }

  void clear() {
    ref.read(cashExchangeProvider.notifier).clear();
  }

  void calculate() {
    ref.read(calculateProvider.notifier).calculate();
    context.push(CalculateScreen.routeName);
  }

  @override
  void dispose() {
    _moneyController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
