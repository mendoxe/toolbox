import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooolbox/screens/components/custom_snackbar.dart';
import 'package:tooolbox/screens/password_generator/control/psw_generator_provider.dart';

class PwsTextField extends ConsumerStatefulWidget {
  const PwsTextField({Key? key}) : super(key: key);

  @override
  ConsumerState<PwsTextField> createState() => _PwsTextFieldState();
}

class _PwsTextFieldState extends ConsumerState<PwsTextField> {
  late TextEditingController _controller;

  late FocusNode _node;
  bool readOnly = true;

  @override
  void initState() {
    _controller = ref.read(pswGeneratorProvider).textEditingController;

    _node = FocusNode()
      ..addListener(() {
        if (readOnly) _node.unfocus();
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          focusNode: _node,
          readOnly: readOnly,
          controller: _controller,
          maxLines: 4,
          minLines: 1,
          decoration: InputDecoration(
            hintText: "Generate password...",
            prefixIcon: IconButton(
              onPressed: _readOnly,
              icon: Icon(
                Icons.edit,
                color: readOnly ? Colors.grey.shade600 : Colors.blue,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: _copyContent,
              icon: const Icon(Icons.copy),
            ),
          ),
        ),
      ),
    );
  }

  void _copyContent() {
    Clipboard.setData(ClipboardData(text: _controller.text));
    ScaffoldMessenger.of(context)
        .showSnackBar("Password copied to clipboard".toSnackBar());
  }

  void _readOnly() {
    setState(() {
      readOnly = !readOnly;
      if (_node.hasFocus && readOnly) {
        _node.unfocus();
      } else {
        _node.requestFocus();
      }
    });
  }
}
