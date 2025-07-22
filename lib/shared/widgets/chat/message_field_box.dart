
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final void Function(String) onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Escribí tu mensaje...',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_rounded),
        onPressed: () {
          final textValue = textController.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextField(
      controller: textController,
      focusNode: focusNode,
      decoration: inputDecoration,
      onSubmitted: (value) {
        textController.clear();
        onValue(value);
      },
    );
  }
}