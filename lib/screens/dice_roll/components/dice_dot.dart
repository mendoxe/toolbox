import 'package:flutter/material.dart';

class DiceDot extends StatelessWidget {
  const DiceDot({
    super.key,
    required this.opacity,
  });

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        width: 15,
        height: 15,
      ),
    );
  }
}
