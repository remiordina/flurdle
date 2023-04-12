import 'dart:math';

import 'package:flurdle/presentation/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'presentation/pages/wordle_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var words = const ['WORDLE', 'STATE', 'TEXT', 'TEST', 'OTHER'];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final random = Random();
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WorldePage(
              title: 'FLURDLE',
              correctWord: words[random.nextInt(words.length)],
              successCallback: (attempts, word) =>
                  Navigator.pushReplacementNamed(context, '/success',
                      arguments: ScreenArguments(word, attempts)),
              failedCallback: (attempts, word) =>
                  Navigator.pushReplacementNamed(context, '/gameover',
                      arguments: ScreenArguments(word, attempts)),
            ),
        '/success': (context) {
          var screenArgs =
              ModalRoute.of(context)!.settings.arguments as ScreenArguments;
          return ResultPage(
            title: 'Gefeliciteerd',
            message:
                'Juiste woord (${screenArgs.word}) geraden in ${screenArgs.attempts} pogingen!',
          );
        },
        '/gameover': (context) {
          var screenArgs =
              ModalRoute.of(context)!.settings.arguments as ScreenArguments;
          return ResultPage(
            title: 'Helaas',
            message:
                'Het is niet gelukt om in ${screenArgs.attempts} pogingen het juiste woord te vinden, het woord wat we zochten was "${screenArgs.word}", probeer het nogmaals met een nieuw woord.',
          );
        },
      },
    );
  }
}

class ScreenArguments {
  final String word;
  final int attempts;

  ScreenArguments(this.word, this.attempts);
}
