import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooolbox/screens/password_generator/control/psw_generator_provider.dart';

import '../control/psw_generator_state.dart';

class PswCheckboxListTile extends ConsumerWidget {
  const PswCheckboxListTile(
      {Key? key, required this.title, required this.sub, required this.input})
      : super(key: key);

  final String title;
  final String sub;
  final PswInput input;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: ref.watch(pswGeneratorProvider).inputs.contains(input),
      activeColor: Colors.lightBlue,
      title: Text(title),
      subtitle: Text(sub),
      onChanged: (value) {
        if (value == null) return;
        if (value) {
          ref.read(pswGeneratorProvider.notifier).addInputModifier(input);
        } else {
          ref.read(pswGeneratorProvider.notifier).removeInputModifier(input);
        }
      },
    );
  }
}
