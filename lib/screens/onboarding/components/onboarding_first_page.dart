import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:tooolbox/utils/extensions.dart';

class OnboardingFirstPage extends StatelessWidget {
  const OnboardingFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LottieBuilder.asset("assets/lotties/tools.json", height: 150),
        30.tall,
        Text(
          "Pick a tool from dashboard",
          style: context.txtTheme.headlineSmall,
        ),
        12.tall,
        Text(
          "Open through icon or search for the desired tool \n in search bar",
          textAlign: TextAlign.center,
          style: context.txtTheme.bodyMedium,
        ),
      ],
    ).animate().fadeIn().scale();
  }
}
