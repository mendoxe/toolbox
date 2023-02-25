import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tooolbox/screens/components/buttons/default_button.dart';
import 'package:tooolbox/screens/components/custom_back_button.dart';
import 'package:tooolbox/screens/password_generator/components/psw_checkbox_listtile.dart';
import 'package:tooolbox/screens/password_generator/components/psw_text_field.dart';
import 'package:tooolbox/screens/password_generator/control/psw_generator_provider.dart';

import 'components/listtile_slider.dart';
import 'control/psw_generator_state.dart';

class PasswordGeneratorScreen extends ConsumerWidget {
  const PasswordGeneratorScreen({Key? key}) : super(key: key);

  static const String routeName = "/passwordGenerator";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Hero(
          tag: "Password Generator",
          child: Text("Password Generator"),
        ),
      ),
      body: Column(
        children: [
          const PwsTextField(),
          const SizedBox(height: 24),
          const PswCheckboxListTile(
            title: "Include lowercase characters",
            sub: "abcdefg...",
            input: PswInput.lowercase,
          ),
          const PswCheckboxListTile(
            title: "Include uppercase characters",
            sub: "ABCDEFG...",
            input: PswInput.uppercase,
          ),
          const PswCheckboxListTile(
            title: "Include numbers",
            sub: "0123456789",
            input: PswInput.numbers,
          ),
          const PswCheckboxListTile(
            title: "Include symbols",
            sub: ".,/()[]{};:@#!?%*",
            input: PswInput.symbols,
          ),
          const SizedBox(height: 16),
          const ListTileSlider(),
          const SizedBox(height: 32),
          DefaultButton(
            label: 'Generate',
            icon: FontAwesomeIcons.hammer,
            onTap: ref.read(pswGeneratorProvider.notifier).generatePassword,
          ),
        ]
            .animate(interval: 50.ms)
            .fadeIn(duration: 150.ms, curve: Curves.ease)
            .slideX(),
      ),
    );
  }
}
