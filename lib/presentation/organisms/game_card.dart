import 'package:flutter/material.dart';
import 'package:flurdle/models/game_card_state.dart';
import 'package:flurdle/presentation/atoms/letter_card.dart';
import 'package:flurdle/presentation/molecules/card_row.dart';

class GameCard extends StatelessWidget {
  GameCard({
    Key? key,
    required this.gameCard,
  }) : super(key: key);

  GameCardState gameCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var gameCardRow = 0; gameCardRow < gameCard.maxRows; gameCardRow++)
          (gameCard.getRow(gameCardRow).isEmpty)
              ? const Spacer()
              : CardRow(
                  letters: [
                    for (var gameCardColumn = 0;
                        gameCardColumn < gameCard.getRow(gameCardRow).length;
                        gameCardColumn++)
                      LetterCard(
                          letter: gameCard
                                  .getLetter(gameCardRow, gameCardColumn)
                                  ?.value ??
                              '',
                          backgroundColor: (gameCard.getLetter(
                                      gameCardRow, gameCardColumn) !=
                                  null)
                              ? gameCard
                                  .getLetter(gameCardRow, gameCardColumn)!
                                  .status
                                  .color
                              : Colors.white,
                          borderColor: (gameCardRow ==
                                      gameCard.currentRowIndex &&
                                  gameCardColumn == gameCard.currentColIndex)
                              ? Colors.black
                              : Colors.grey),
                  ],
                )
      ],
    );
  }
}
