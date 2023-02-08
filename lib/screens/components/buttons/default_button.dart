import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.icon,
    this.iconSIze,
    this.width,
    this.height,
  }) : super(key: key);

  final String label;
  final Function() onTap;
  final IconData? icon;
  final double? iconSIze;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    Text text = Text(
      label,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: Colors.white, fontSize: 16),
    );
    TextButton button;
    if (icon == null) {
      button = TextButton(
        onPressed: onTap,
        child: text,
      );
    } else {
      button = TextButton.icon(
        onPressed: onTap,
        icon: FaIcon(
          icon,
          color: Colors.white,
          size: iconSIze ?? 18,
        ),
        label: text,
      );
    }

    return SizedBox(
      width: width ?? 160,
      height: height ?? 36,
      child: button,
    );
  }
}
