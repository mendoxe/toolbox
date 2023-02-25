import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooolbox/screens/password_generator/control/psw_generator_provider.dart';

class ListTileSlider extends ConsumerWidget {
  const ListTileSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          "Password length:  ${ref.watch(pswGeneratorProvider).pswLength.toInt().toString()}",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      subtitle: Slider(
        min: 8,
        max: 64,
        divisions: 57,
        value: ref.watch(pswGeneratorProvider).pswLength.toDouble(),
        onChanged: (value) {
          ref
              .read(pswGeneratorProvider.notifier)
              .changePswLength(value.toInt());
        },
      ),
    );
  }
}
