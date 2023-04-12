import 'package:flutter/material.dart';
import 'package:flurdle/models/keyboard_action.dart';
import 'package:flurdle/models/letter_model.dart';
import 'package:flurdle/presentation/atoms/keyboard_key.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    Key? key,
    required this.onKeyPressed,
    required this.usedLetters,
  }) : super(key: key);

  final Function(KeyboardAction) onKeyPressed;
  final List<LetterModel> usedLetters;

  @override
  Widget build(BuildContext context) {
    List<List<KeyboardAction>> rows = List.generate(
      6,
      (index) {
        return KeyboardAction.values
            .where((action) => action.rowIndex == index)
            .toList()
          ..sort((a, b) => a.order.compareTo(b.order));
      },
    );

    return Column(
      children: [
        for (final row in rows)
          Row(
            children: [
              for (final action in row)
                KeyboardKey(
                  keyboardAction: action,
                  onPressed: onKeyPressed,
                  statusCallback: _getLetterStatus,
                ),
            ],
          ),
      ],
    );
  }

  LetterStatus _getLetterStatus(KeyboardAction keyboardAction) => usedLetters
      .firstWhere((element) => element.value == keyboardAction.value,
          orElse: () => LetterModel(value: ''))
      .status;
}
