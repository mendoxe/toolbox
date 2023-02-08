import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CoinFlipScreen extends StatefulWidget {
  const CoinFlipScreen({Key? key}) : super(key: key);

  static const String routeName = "/coinFlip";

  @override
  _CoinFlipScreenState createState() => _CoinFlipScreenState();
}

class _CoinFlipScreenState extends State<CoinFlipScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
      upperBound: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: "Coin Flip",
          child: Text("Coin Flip"),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _coinPressed,
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                final rotation = pi * _animationController.value;

                final position = ((_animationController.value -
                        _animationController.value.floor()) >
                    0.5);
                final isFront = _animationController.value.floor().isEven
                    ? position
                    : !position;

                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(rotation),
                  alignment: FractionalOffset.center,
                  child: Image.asset(
                    isFront
                        ? "assets/images/coin_front.png"
                        : "assets/images/coin_back.png",
                    width: isFront
                        ? MediaQuery.of(context).size.width / 1.45
                        : MediaQuery.of(context).size.width,
                  ),
                );
              }),
        ),
      ).animate().scale().fadeIn(),
    );
  }

  Future<void> _coinPressed() async {
    _animationController.reset();
    if (Random().nextInt(2) == 1) {
      await _animationController.forward();
      return;
    } else {
      await _animationController.animateTo(4);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
