import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: () => context.beamToNamed(HomeScreen.routeName),
    );
  }
}
