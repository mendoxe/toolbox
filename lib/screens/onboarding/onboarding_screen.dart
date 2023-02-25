import 'package:flutter/material.dart';
import 'package:tooolbox/screens/onboarding/components/onboarding_control.dart';
import 'package:tooolbox/screens/onboarding/components/onboarding_first_page.dart';
import 'package:tooolbox/screens/onboarding/components/onboarding_third_page.dart';

import 'components/onboarding_header_progress.dart';
import 'components/onboarding_second_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static const String routeName = "/onboarding";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int index = 0;

  Color get bgColor => index == 0
      ? Colors.blue
      : index == 1
          ? Colors.deepPurple
          : Colors.green;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              OnboardingHeaderProgress(index: index),
              const Spacer(),
              if (index == 0) const OnboardingFirstPage(),
              if (index == 1) const OnboardingSecondPage(),
              if (index == 2) const OnboardingThirdPage(),
              const Spacer(),
              OnboardingControl(
                index: index,
                previousPage: previousPage,
                nextPage: nextPage,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void nextPage() {
    if (index == 2) return;
    setState(() {
      index++;
    });
  }

  void previousPage() {
    if (index == 0) return;
    setState(() {
      index--;
    });
  }
}
