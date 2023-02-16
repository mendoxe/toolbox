import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooolbox/screens/cash_exchange/cash_exchange_screen.dart';
import 'package:tooolbox/screens/calculate/calculate_screen.dart';
import 'package:tooolbox/screens/coin_flip/coin_flip_screen.dart';
import 'package:tooolbox/screens/dice_roll/dice_roll_screen.dart';
import 'package:tooolbox/screens/home/home_screen.dart';
import 'package:tooolbox/screens/password_generator/password_generator_screen.dart';
import 'package:tooolbox/screens/random_pick/random_pick_screen.dart';
import 'package:tooolbox/screens/text_encoder/text_encoder_screen.dart';
import 'package:tooolbox/utils/theme.dart';

import 'firebase_options.dart';

final _routerDelegate = BeamerDelegate(
  locationBuilder: RoutesLocationBuilder(
    routes: {
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
    },
  ),
);

void main() {
  if (TargetPlatform.windows == defaultTargetPlatform) {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const ProviderScope(child: MyApp()));
  } else {
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );

        FlutterError.onError =
            FirebaseCrashlytics.instance.recordFlutterFatalError;

        runApp(const ProviderScope(child: MyApp()));
      },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _routerDelegate,
      routeInformationParser: BeamerParser(),
      debugShowCheckedModeBanner: false,
      title: 'Tooolbox',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
