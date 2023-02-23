import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tooolbox/screens/components/buttons/default_button.dart';
import 'package:tooolbox/screens/dice_roll/control/dice_roll_provider.dart';
import 'components/dice_amount_popup_button.dart';
import 'components/dice_widget.dart';

class DiceRollScreen extends ConsumerStatefulWidget {
  const DiceRollScreen({Key? key}) : super(key: key);

  static const String routeName = "/diceRoll";

  @override
  ConsumerState<DiceRollScreen> createState() => _DiceRollScreenState();
}

class _DiceRollScreenState extends ConsumerState<DiceRollScreen> {
  int amount = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: "Dice Roll",
          child: Text("Dice Roll"),
        ),
        actions: const [DiceAmountPopupButton()],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const DiceWidget(position: 0),
            const Spacer(),
            DefaultButton(
              label: 'Roll',
              onTap: ref.read(diceRollProvider.notifier).rollDice,
              icon: FontAwesomeIcons.dice,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
