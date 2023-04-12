import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LetterCard extends StatelessWidget {
  const LetterCard({
    Key? key,
    this.letter = '',
    this.borderColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
  }) : super(key: key);

  final String letter;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
              width: 3.0,
            ),
          ),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text(
              letter,
              style: GoogleFonts.roboto(
                color: textColor,
              ),
            ),
          ),
        ),
      );
}
