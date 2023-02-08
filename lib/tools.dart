import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tooolbox/model/tool.dart';
import 'package:tooolbox/screens/cash_exchange/cash_exchange_screen.dart';
import 'package:tooolbox/screens/coin_flip/coin_flip_screen.dart';
import 'package:tooolbox/screens/password_generator/password_generator_screen.dart';
import 'package:tooolbox/screens/random_pick/random_pick_screen.dart';
import 'package:tooolbox/screens/text_encoder/text_encoder_screen.dart';

List<Tool> tools = [
  Tool(
    toolIcon: FontAwesomeIcons.key,
    title: "Password Generator",
    color: Colors.lightBlue,
    route: PasswordGeneratorScreen.routeName,
  ),
  Tool(
    toolIcon: Icons.monetization_on_rounded,
    title: "Coin Flip",
    color: Colors.amber,
    route: CoinFlipScreen.routeName,
  ),
  Tool(
    toolIcon: FontAwesomeIcons.dice,
    title: "Random Pick",
    color: Colors.deepOrange,
    route: RandomPickScreen.routeName,
  ),
  Tool(
    toolIcon: FontAwesomeIcons.language,
    title: "Text Encoder",
    color: Colors.purple,
    route: TextEncoderScreen.routeName,
  ),
  Tool(
    toolIcon: FontAwesomeIcons.arrowsDownToPeople,
    title: "Cash Exchange",
    color: Colors.green,
    route: CashExchangeScreen.routeName,
  ),
];
