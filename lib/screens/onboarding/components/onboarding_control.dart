import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tooolbox/screens/home/home_screen.dart';
import 'package:tooolbox/utils/extensions.dart';

class OnboardingControl extends StatelessWidget {
  const OnboardingControl(
      {Key? key,
      required this.index,
      required this.previousPage,
      required this.nextPage})
      : super(key: key);

  final int index;
  final Function() previousPage;
  final Function() nextPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {
            context.go(HomeScreen.routeName);
            Hive.box('settings').put('onboarded', true);
          },
          child: Text(
            index == 2 ? 'Done' : 'Skip',
            style: context.txtTheme.bodyLarge,
          ),
        ),
        const Spacer(),
        AnimatedOpacity(
          opacity: index != 0 ? 1 : 0,
          duration: 150.ms,
          child: InkWell(
            onTap: previousPage,
            borderRadius: BorderRadius.circular(50),
            child: const CircleAvatar(
              backgroundColor: Colors.white38,
              radius: 20,
              child: Icon(
                Icons.chevron_left_rounded,
                size: 36,
                color: Colors.white,
              ),
            ),
          ),
        ),
        20.wide,
        AnimatedOpacity(
          opacity: index != 2 ? 1 : 0,
          duration: 150.ms,
          child: InkWell(
            onTap: nextPage,
            borderRadius: BorderRadius.circular(50),
            child: const CircleAvatar(
              backgroundColor: Colors.white38,
              radius: 20,
              child: Icon(
                Icons.chevron_right_rounded,
                size: 36,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
