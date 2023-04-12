import 'package:flutter/material.dart';
import 'package:flurdle/models/keyboard_action.dart';
import 'package:flurdle/models/game_card_state.dart';
import 'package:flurdle/models/letter_model.dart';
import 'package:flurdle/presentation/atoms/heading.dart';
import 'package:flurdle/presentation/organisms/game_card.dart';
import 'package:flurdle/presentation/organisms/keyboard.dart';
import 'package:flurdle/presentation/templates/page_template.dart';

class WorldePage extends StatefulWidget {
  const WorldePage({
    Key? key,
    required this.title,
    required this.correctWord,
    this.successCallback,
    this.failedCallback,
    this.maxRows = 5,
  }) : super(key: key);

  final String title;

  final String correctWord;
  final int maxRows;

  final Function(int, String)? successCallback;
  final Function(int, String)? failedCallback;

  @override
  // ignore: library_private_types_in_public_api
  _GameState createState() => _GameState();
}

class _GameState extends State<WorldePage> {
  late GameCardState gameCardState;

  @override
  void initState() {
    setState(() {
      gameCardState = GameCardState(
        correctWord: widget.correctWord,
        maxRows: widget.maxRows,
        card: List<List<LetterModel?>>.generate(
          widget.maxRows,
          (_) => List<LetterModel?>.generate(
            widget.correctWord.length,
            (_) => null,
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: Text(widget.title),
        ),
        body: PageTemplate(
          title: const Heading(
            title: 'Wordle',
          ),
          content: GameCard(
            gameCard: gameCardState,
          ),
          bottom: Keyboard(
              onKeyPressed: (a) => _applyGameAction(a),
              usedLetters: gameCardState.getUsedLetters),
        ));
  }

  void _applyGameAction(KeyboardAction action) {
    if (action == KeyboardAction.backspace) {
      setState(() {
        if (gameCardState.hasLetterBefore) {
          gameCardState = gameCardState.withoutLastLetter();
        }
      });
    } else if (action == KeyboardAction.enter) {
      setState(() {
        if (gameCardState.isRowFullyFilled) {
          gameCardState = gameCardState.withValidatedLetters();
          if (gameCardState.isCurrentRowCorrect &&
              widget.successCallback != null) {
            widget.successCallback!(
                gameCardState.currentRowIndex + 1, widget.correctWord);
          } else if (!gameCardState.hasAttemptsLeft &&
              widget.failedCallback != null) {
            widget.failedCallback!(
                gameCardState.currentRowIndex + 1, widget.correctWord);
          }
          gameCardState = gameCardState.forNewRow();
        }
      });
    } else {
      setState(() {
        if (!gameCardState.isRowFullyFilled) {
          gameCardState =
              gameCardState.withNewLetter(LetterModel(value: action.value));
        }
      });
    }
  }
}
