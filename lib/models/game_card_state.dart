import 'package:flurdle/models/letter_model.dart';

class GameCardState {
  GameCardState({
    required this.correctWord,
    required this.maxRows,
    required this.card,
    this.currentColIndex = 0,
    this.currentRowIndex = 0,
  });

  final String correctWord;
  final int maxRows;
  final int currentColIndex;
  final int currentRowIndex;
  final List<List<LetterModel?>> card;

  //Getters
  List<LetterModel?> getRow(int rowNumber) {
    return card[rowNumber];
  }

  LetterModel? getLetter(int rowNumber, int colNumber) {
    return card[rowNumber][colNumber];
  }

  bool get hasLetterBefore =>
      (currentColIndex > 0 && currentRowIndex < correctWord.length);

  bool get hasAttemptsLeft => (currentRowIndex < maxRows - 1);

  bool get isRowFullyFilled =>
      (currentRowIndex < maxRows && currentColIndex == correctWord.length);

  bool get isCurrentRowCorrect {
    for (var i = 0; i < card[currentRowIndex].length; i++) {
      if (card[currentRowIndex][i]?.value != correctWord.substring(i, i + 1)) {
        return false;
      }
    }
    return true;
  }

  List<LetterModel> get getUsedLetters {
    List<LetterModel> usedLetters = [];
    for (List<LetterModel?> row in card) {
      for (LetterModel? letter in row) {
        //Skip null values
        if (letter == null) {
          continue;
        }
        //Check for letters on the right place
        if (letter.status == LetterStatus.rightPlace) {
          usedLetters.removeWhere((element) => letter.value == element.value);
          usedLetters.add(letter);
        }
        //Check for letters on the wrong place
        else if (letter.status == LetterStatus.wrongPlace) {
          usedLetters.removeWhere((element) =>
              letter.value == element.value &&
              letter.status != LetterStatus.rightPlace);
          if (!usedLetters.any((element) => element.value == letter.value)) {
            usedLetters.add(letter);
          }
        }
        //Check for letters that aren't in
        else if (letter.status == LetterStatus.notIn &&
            !usedLetters.any((element) => element.value == letter.value)) {
          usedLetters.add(letter);
        }
      }
    }
    return usedLetters;
  }

  //State constructors

  GameCardState withNewLetter(LetterModel letter) {
    var newCard = card.toList();
    newCard[currentRowIndex] = newCard[currentRowIndex].toList();
    newCard[currentRowIndex][currentColIndex] = letter;
    return copyWith(card: newCard, currentColIndex: currentColIndex + 1);
  }

  GameCardState withoutLastLetter() {
    var newCard = card.toList();
    newCard[currentRowIndex] = newCard[currentRowIndex].toList();
    newCard[currentRowIndex][currentColIndex - 1] = null;
    return copyWith(card: newCard, currentColIndex: currentColIndex - 1);
  }

  GameCardState forNewRow() {
    return copyWith(currentColIndex: 0, currentRowIndex: currentRowIndex + 1);
  }

  GameCardState withValidatedLetters() {
    var newCard = card.toList();
    newCard[currentRowIndex] = newCard[currentRowIndex].map((e) {
      final index = newCard[currentRowIndex].indexOf(e);
      final correctLetter = correctWord.substring(index, index + 1);
      if (e!.value == correctLetter) {
        return LetterModel.rightPlace(value: e.value);
      } else if (correctWord.contains(e.value)) {
        return LetterModel.wrongPlace(value: e.value);
      } else {
        return LetterModel.notIn(value: e.value);
      }
    }).toList();
    return copyWith(card: newCard);
  }

  GameCardState copyWith({
    String? correctWord,
    int? maxRows,
    int? currentColIndex,
    int? currentRowIndex,
    List<List<LetterModel?>>? card,
  }) {
    return GameCardState(
      correctWord: correctWord ?? this.correctWord,
      maxRows: maxRows ?? this.maxRows,
      currentColIndex: currentColIndex ?? this.currentColIndex,
      currentRowIndex: currentRowIndex ?? this.currentRowIndex,
      card: card ?? this.card,
    );
  }
}
