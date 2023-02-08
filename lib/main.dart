import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooolbox/screens/cash_exchange/cash_exchange_screen.dart';
import 'package:tooolbox/screens/calculate/calculate_screen.dart';
import 'package:tooolbox/screens/coin_flip/coin_flip_screen.dart';
import 'package:tooolbox/screens/home/home_screen.dart';
import 'package:tooolbox/screens/password_generator/password_generator_screen.dart';
import 'package:tooolbox/screens/random_pick/random_pick_screen.dart';
import 'package:tooolbox/screens/text_encoder/text_encoder_screen.dart';
import 'package:tooolbox/utils/theme.dart';

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
    },
  ),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
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
