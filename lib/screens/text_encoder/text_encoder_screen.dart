import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tooolbox/screens/components/buttons/default_button.dart';
import 'package:tooolbox/screens/components/custom_back_button.dart';
import 'package:tooolbox/screens/components/custom_snackbar.dart';
import 'package:tooolbox/screens/components/empty_widget.dart';
import 'package:tooolbox/screens/text_encoder/control/text_encoder_provider.dart';

class TextEncoderScreen extends ConsumerStatefulWidget {
  const TextEncoderScreen({Key? key}) : super(key: key);

  static const String routeName = "/textEncoder";

  @override
  ConsumerState<TextEncoderScreen> createState() => _TextEncoderScreenState();
}

class _TextEncoderScreenState extends ConsumerState<TextEncoderScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Hero(
          tag: "Text Encoder",
          child: Text("Text Encoder"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(encoderNotifierProvider.notifier).reset();
            },
            icon: const FaIcon(
              FontAwesomeIcons.broom,
              size: 22,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextField(
                controller: _controller,
                maxLines: 3,
                minLines: 1,
                decoration: const InputDecoration(
                  hintText: "Enter value...",
                ),
              ),
            ),
          ),
          const Spacer(),
          ref.watch(encoderNotifierProvider).encodedText.isNotEmpty
              ? Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.only(
                        right: 42.0,
                        left: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      child: SelectableText(
                        ref.watch(encoderNotifierProvider).encodedText,
                        style: textTheme.headlineSmall,
                      ),
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: IconButton(
                        onPressed: () => copy(),
                        icon: const Icon(Icons.copy),
                      ),
                    ),
                  ],
                ).animate().scale().fadeIn()
              : const EmptyWidget(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultButton(
                label: 'Encrypt',
                onTap: encryptText,
                icon: FontAwesomeIcons.lock,
                iconSIze: 15,
              ),
              DefaultButton(
                label: 'Decrypt',
                onTap: decryptText,
                icon: FontAwesomeIcons.lockOpen,
                iconSIze: 15,
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void encryptText() {
    String text = _controller.text;
    if (text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar("Value can't be empty...".toSnackBar());
      return;
    }
    ref.read(encoderNotifierProvider.notifier).encryptText(text);
    _controller.clear();
  }

  void decryptText() {
    String text = _controller.text;
    if (text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar("Value can't be empty...".toSnackBar());
      return;
    }
    ref.read(encoderNotifierProvider.notifier).decryptText(text);
    _controller.clear();
  }

  void copy() async {
    await Clipboard.setData(
      ClipboardData(text: ref.read(encoderNotifierProvider).encodedText),
    );
    ScaffoldMessenger.of(context)
        .showSnackBar("Copied to Clipboard".toSnackBar());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
