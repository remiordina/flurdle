import 'package:flutter/material.dart';
import 'package:flurdle/models/keyboard_action.dart';
import 'package:flurdle/models/letter_model.dart';

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({
    Key? key,
    required this.keyboardAction,
    required this.onPressed,
    required this.statusCallback,
  }) : super(key: key);

  final KeyboardAction keyboardAction;
  final void Function(KeyboardAction key) onPressed;
  final LetterStatus Function(KeyboardAction key) statusCallback;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(statusCallback(keyboardAction).color),
      ),
      onPressed: () => onPressed(keyboardAction),
      child: Text(
        keyboardAction.value,
      ),
    );
  }
}
