import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tooolbox/screens/components/buttons/default_button.dart';
import 'package:tooolbox/screens/components/empty_widget.dart';
import 'package:tooolbox/screens/random_pick/control/random_pick_provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RandomPickScreen extends ConsumerStatefulWidget {
  const RandomPickScreen({Key? key}) : super(key: key);

  static const String routeName = "/randomPick";

  @override
  ConsumerState<RandomPickScreen> createState() => _RandomPickScreenState();
}

class _RandomPickScreenState extends ConsumerState<RandomPickScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: "Random Pick",
          child: Text("Random Pick"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(randomPickProvider.notifier).resetValues();
            },
            icon: const FaIcon(FontAwesomeIcons.broom, size: 22),
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
                decoration: InputDecoration(
                  hintText: "Enter value...",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: addValue,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: ref
                .watch(randomPickProvider)
                .values
                .map(
                  (String val) => Chip(
                    label: Text(val),
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    onDeleted: () {
                      ref.read(randomPickProvider.notifier).removeValue(val);
                    },
                  ),
                )
                .toList(),
          ),
          const Spacer(),
          ref.watch(randomPickProvider).selectedValue.isNotEmpty
              ? Text(
                  ref.watch(randomPickProvider).selectedValue,
                  style: Theme.of(context).textTheme.headline3,
                ).animate().scale().fadeIn()
              : const EmptyWidget(),
          const Spacer(),
          DefaultButton(label: "Pick Value", onTap: pickRandomValue),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void pickRandomValue() {
    if (ref.read(randomPickProvider.notifier).pickRandomValue()) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "No values to choose from...",
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }

  void addValue() {
    String text = _controller.text;
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Value can't be empty...",
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
      ));
      return;
    }
    ref.read(randomPickProvider.notifier).addValue(text);
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
