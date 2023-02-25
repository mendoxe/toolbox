import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tooolbox/screens/components/buttons/default_button.dart';
import 'package:tooolbox/screens/components/custom_back_button.dart';
import 'package:tooolbox/screens/components/custom_snackbar.dart';
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
  AnimationController? _animationController;
  late FocusNode _focusNode;

  @override
  void initState() {
    _controller = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomBackButton(),
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
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: TextField(
                      autofocus: true,
                      focusNode: _focusNode,
                      controller: _controller,
                      onSubmitted: (_) => addValue(),
                      decoration: const InputDecoration(
                        hintText: "Enter value...",
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: addValue,
              ),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ref.watch(randomPickProvider).values.length,
              itemBuilder: (context, index) {
                String val = ref.watch(randomPickProvider).values[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Chip(
                    label: Text(val),
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    onDeleted: () {
                      ref.read(randomPickProvider.notifier).removeValue(val);
                    },
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          ref.watch(randomPickProvider).selectedValue.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref.watch(randomPickProvider).selectedValue,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
                      .animate(
                        onPlay: (controller) =>
                            _animationController = controller,
                      )
                      .scale()
                      .fadeIn()
                      .then()
                      .shake(),
                )
              : const EmptyWidget(),
          const Spacer(),
          DefaultButton(label: "Pick Value", onTap: pickRandomValue),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void pickRandomValue() {
    if (ref.read(randomPickProvider.notifier).pickRandomValue()) {
      if (_animationController != null) {
        _animationController!.forward();
      }
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      "No values to choose from...".toSnackBar(),
    );
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
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
