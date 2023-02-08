import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooolbox/model/creditor.dart';
import 'package:tooolbox/model/debtor.dart';
import 'package:tooolbox/screens/calculate/control/calculate_provider.dart';

class CalculateScreen extends ConsumerWidget {
  const CalculateScreen({Key? key}) : super(key: key);

  static const String routeName = "/calculate";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.beamBack(),
        ),
        title: const Text('Calculate'),
      ),
      body: Column(
        children: ref
            .watch(calculateProvider)
            .debtors
            .map(
              (Debtor debtor) => ExpansionTile(
                initiallyExpanded: true,
                title: Text(debtor.name),
                children: debtor.creditors
                    .map(
                      (Creditor creditor) => ListTile(
                        title: Text(creditor.name),
                        subtitle: Text(creditor.amount.toStringAsFixed(2)),
                      ),
                    )
                    .toList()
                    .animate(interval: 50.ms)
                    .fadeIn(duration: 150.ms, curve: Curves.ease)
                    .slideX(),
              ),
            )
            .toList(),
      ),
    );
  }
}
