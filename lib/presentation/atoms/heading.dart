import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.lobster(
        color: Theme.of(context).primaryColor,
        fontSize: 24.0,
        textStyle: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
