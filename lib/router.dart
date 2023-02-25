import 'package:beamer/beamer.dart';
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

final routerDelegate = BeamerDelegate(
  locationBuilder: RoutesLocationBuilder(
    routes: {
      SplashScreen.routeName: (context, state, data) => const SplashScreen(),
      OnboardingScreen.routeName: (context, state, data) =>
          const OnboardingScreen(),
      HomeScreen.routeName: (context, state, data) => const HomeScreen(),
      CoinFlipScreen.routeName: (context, state, data) =>
          const CoinFlipScreen(),
      RandomPickScreen.routeName: (context, state, data) =>
          const RandomPickScreen(),
      TextEncoderScreen.routeName: (context, state, data) =>
          const TextEncoderScreen(),
      PasswordGeneratorScreen.routeName: (context, state, data) =>
          const PasswordGeneratorScreen(),
      CashExchangeScreen.routeName: (context, state, data) =>
          const CashExchangeScreen(),
      CalculateScreen.routeName: (context, state, data) =>
          const CalculateScreen(),
      DiceRollScreen.routeName: (context, state, data) =>
          const DiceRollScreen(),
      QrGeneratorScreen.routeName: (context, state, data) =>
          const QrGeneratorScreen(),
      QrReaderScreen.routeName: (context, state, data) =>
          const QrReaderScreen(),
    },
  ),
);
