import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      duration: 1.seconds,
    );
  }
}
