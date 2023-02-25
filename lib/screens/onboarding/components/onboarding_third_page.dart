import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:tooolbox/utils/extensions.dart';

class OnboardingThirdPage extends StatelessWidget {
  const OnboardingThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LottieBuilder.asset(
          'assets/lotties/assistance.json',
          height: 200,
        ),
        30.tall,
        Text(
          "Have feedback or a proposition?",
          style: context.txtTheme.headlineSmall,
        ),
        12.tall,
        Text(
          "We are always looking for ways to enhance the app, so please do report any feedback or any new tool propositions.",
          textAlign: TextAlign.center,
          style: context.txtTheme.bodyMedium,
        ),
        8.tall,
      ].animate().fadeIn().scale(),
    );
  }
}
