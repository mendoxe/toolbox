import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingHeaderProgress extends StatelessWidget {
  const OnboardingHeaderProgress({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 6,
          width: 70,
        ),
        AnimatedContainer(
          duration: 150.ms,
          decoration: BoxDecoration(
            color: index > 0 ? Colors.white : Colors.white30,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 6,
          width: 70,
        ),
        AnimatedContainer(
          duration: 150.ms,
          decoration: BoxDecoration(
            color: index > 1 ? Colors.white : Colors.white30,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 6,
          width: 70,
        ),
      ],
    );
  }
}
