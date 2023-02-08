import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [ScaleEffect(), FadeEffect()],
      child: Lottie.asset('assets/lotties/empty_box.json'),
    );
  }
}
