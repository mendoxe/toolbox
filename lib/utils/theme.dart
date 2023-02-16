// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color DARKGREY = Color(0xFF222831);
const Color LIGHTGREY = Color(0xFF393E46);
const Color BLUEGREEN = Color(0xFF00ADB5);
const Color DARKWHITE = Color(0xFFEEEEEE);

ThemeData get lightTheme => ThemeData(
      primarySwatch: Colors.lightBlue,
      primaryColor: Colors.lightBlue,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
        bodyText2: GoogleFonts.barlow(
          fontSize: 12,
        ),
        bodyText1: GoogleFonts.barlow(
          fontSize: 14,
        ),
        headline6: GoogleFonts.barlow(
          fontSize: 16,
        ),
      ),
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primarySwatch: Colors.lightBlue,
      primaryColor: Colors.lightBlue,
      scaffoldBackgroundColor: DARKGREY,
      cardColor: LIGHTGREY,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: LIGHTGREY,
        border: InputBorder.none,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        backgroundColor: Colors.lightBlue,
      )),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: GoogleFonts.barlow(fontSize: 18),
      ),
      textTheme: TextTheme(
        bodyText2: GoogleFonts.barlow(
          fontSize: 12,
        ),
        bodyText1: GoogleFonts.barlow(
          fontSize: 14,
        ),
        headline6: GoogleFonts.barlow(
          fontSize: 16,
        ),
        headline5: GoogleFonts.barlow(
          fontSize: 18,
        ),
        headline4: GoogleFonts.barlow(
          fontSize: 24,
        ),
        headline3: GoogleFonts.barlow(
          fontSize: 32,
        ),
        headlineLarge: GoogleFonts.barlow(fontSize: 42),
      ),
    );
