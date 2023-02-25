import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tooolbox/screens/coin_flip/coin_flip_screen.dart';
import 'package:tooolbox/screens/onboarding/onboarding_screen.dart';
import 'package:tooolbox/screens/qr_generator/qr_generator_screen.dart';
import 'package:tooolbox/screens/qr_reader/qr_reader_screen.dart';
import 'package:tooolbox/screens/random_pick/random_pick_screen.dart';
import 'package:tooolbox/screens/splash/splash_screen.dart';
import 'package:tooolbox/screens/text_encoder/text_encoder_screen.dart';

import 'screens/calculate/calculate_screen.dart';
import 'screens/cash_exchange/cash_exchange_screen.dart';
import 'screens/dice_roll/dice_roll_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/password_generator/password_generator_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: SplashScreen.routeName,
  routes: <RouteBase>[
    GoRoute(
      path: SplashScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: OnboardingScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),
    GoRoute(
      path: HomeScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: CoinFlipScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const CoinFlipScreen();
      },
    ),
    GoRoute(
      path: RandomPickScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const RandomPickScreen();
      },
    ),
    GoRoute(
      path: TextEncoderScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const TextEncoderScreen();
      },
    ),
    GoRoute(
      path: PasswordGeneratorScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const PasswordGeneratorScreen();
      },
    ),
    GoRoute(
      path: CashExchangeScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const CashExchangeScreen();
      },
    ),
    GoRoute(
      path: CalculateScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const CalculateScreen();
      },
    ),
    GoRoute(
      path: DiceRollScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const DiceRollScreen();
      },
    ),
    GoRoute(
      path: QrGeneratorScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const QrGeneratorScreen();
      },
    ),
    GoRoute(
      path: QrReaderScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const QrReaderScreen();
      },
    ),
  ],
);
