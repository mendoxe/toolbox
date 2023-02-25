import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:tooolbox/screens/components/buttons/default_button.dart';
import 'package:tooolbox/screens/components/custom_back_button.dart';
import 'package:tooolbox/screens/dice_roll/components/dice_spawner.dart';
import 'package:tooolbox/screens/dice_roll/control/dice_roll_provider.dart';
import 'components/dice_amount_popup_button.dart';

class DiceRollScreen extends ConsumerStatefulWidget {
  const DiceRollScreen({Key? key}) : super(key: key);

  static const String routeName = "/diceRoll";

  @override
  ConsumerState<DiceRollScreen> createState() => _DiceRollScreenState();
}

class _DiceRollScreenState extends ConsumerState<DiceRollScreen> {
  int amount = 6;
  late StreamSubscription<AccelerometerEvent> accelerometrStream;

  @override
  void initState() {
    super.initState();
    accelerometrStream = accelerometerEvents.listen((AccelerometerEvent event) {
      // Calculate the total acceleration vector using Pythagoras' theorem
      double acceleration =
          sqrt(pow(event.x, 2) + pow(event.y, 2) + pow(event.z, 2));

      // If the acceleration is above a certain threshold, assume the phone is shaking
      if (acceleration > 40) {
        ref.read(diceRollProvider.notifier).rollDice();
        debugPrint('Phone is shaking!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
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
            const DiceSpawner(),
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

  @override
  void dispose() {
    accelerometrStream.cancel();
    super.dispose();
  }
}
