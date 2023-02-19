import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension Snack on String {
  SnackBar toSnackBar() {
    return SnackBar(
      content: Text(this),
      behavior: SnackBarBehavior.floating,
      duration: 1.seconds,
    );
  }
}
