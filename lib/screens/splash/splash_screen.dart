import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:tooolbox/screens/home/home_screen.dart';
import 'package:tooolbox/screens/onboarding/onboarding_screen.dart';
import 'package:tooolbox/utils/extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(600.ms, () {
      bool isOnboarded = Hive.box('settings').get('onboarded') ?? false;
      if (isOnboarded) {
        context.go(HomeScreen.routeName);
      } else {
        context.go(OnboardingScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            100.tall,
            Text(
              'Toolbox',
              style: context.txtTheme.headlineLarge!
                  .copyWith(color: Colors.blueGrey[200]),
            ),
            60.tall,
            LottieBuilder.asset(
              'assets/lotties/loading_circles.json',
              height: 150,
            ),
            100.tall,
            Text(
              'Wait please, we are loading content...',
              textAlign: TextAlign.center,
              style: context.txtTheme.headlineSmall!
                  .copyWith(color: Colors.blueGrey[200]),
            ),
          ],
        ),
      ),
    );
  }
}
