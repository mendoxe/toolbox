import 'package:flutter/material.dart';

class EncoderButton extends StatelessWidget {
  const EncoderButton(
      {Key? key, required this.call, required this.icon, required this.label})
      : super(key: key);

  final Function call;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 36,
        child: TextButton.icon(
          onPressed: () => call(),
          icon: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          label: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
