import 'package:flutter/material.dart';
import 'package:flurdle/presentation/atoms/heading.dart';
import 'package:flurdle/presentation/templates/page_template.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: Text(title),
        ),
        body: PageTemplate(
          title: Heading(
            title: title,
          ),
          content: Text(message),
          bottom: OutlinedButton(
              child: const Text('Start new game'),
              onPressed: () => Navigator.pushReplacementNamed(context, '/')),
        ));
  }
}
