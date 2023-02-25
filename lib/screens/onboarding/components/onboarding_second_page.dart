import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:tooolbox/utils/extensions.dart';

class OnboardingSecondPage extends StatelessWidget {
  const OnboardingSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LottieBuilder.asset(
          'assets/lotties/confusion.json',
          height: 200,
        ),
        30.tall,
        Text(
          "Not sure what to do with the tool?",
          style: context.txtTheme.headlineSmall,
        ),
        12.tall,
        Text(
          "Most tools are extremely simple and require only a tap or entering some values.",
          textAlign: TextAlign.center,
          style: context.txtTheme.bodyMedium,
        ),
        8.tall,
        Row(
          children: [
            Flexible(
              child: Text(
                "However, if you are still confused, look for the question mark symbol for some tips.",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: context.txtTheme.bodyMedium,
              ),
            ),
            const Icon(Icons.help),
          ],
        ),
      ].animate().fadeIn().scale(),
    );
  }
}
