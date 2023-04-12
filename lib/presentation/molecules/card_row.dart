import 'package:flutter/material.dart';
import 'package:flurdle/presentation/atoms/letter_card.dart';

class CardRow extends StatelessWidget {
  const CardRow({
    Key? key,
    required this.letters,
  }) : super(key: key);

  final List<LetterCard> letters;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: letters
          .map((e) => Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 2.0,
                vertical: 2.0,
              ),
              width: 60,
              child: e))
          .toList(),
    );
  }
}
