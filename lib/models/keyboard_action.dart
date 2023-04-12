enum KeyboardAction {
  letterA(value: 'A', rowIndex: 1, order: 0),
  letterB(value: 'B', rowIndex: 2, order: 5),
  letterC(value: 'C', rowIndex: 2, order: 3),
  letterD(value: 'D', rowIndex: 1, order: 2),
  letterE(value: 'E', rowIndex: 0, order: 2),
  letterF(value: 'F', rowIndex: 1, order: 3),
  letterG(value: 'G', rowIndex: 1, order: 4),
  letterH(value: 'H', rowIndex: 1, order: 5),
  letterI(value: 'I', rowIndex: 0, order: 7),
  letterJ(value: 'J', rowIndex: 1, order: 6),
  letterK(value: 'K', rowIndex: 1, order: 7),
  letterL(value: 'L', rowIndex: 1, order: 8),
  letterM(value: 'M', rowIndex: 2, order: 7),
  letterN(value: 'N', rowIndex: 2, order: 6),
  letterO(value: 'O', rowIndex: 0, order: 8),
  letterP(value: 'P', rowIndex: 0, order: 9),
  letterQ(value: 'Q', rowIndex: 0, order: 0),
  letterR(value: 'R', rowIndex: 0, order: 3),
  letterS(value: 'S', rowIndex: 1, order: 1),
  letterT(value: 'T', rowIndex: 0, order: 4),
  letterU(value: 'U', rowIndex: 0, order: 6),
  letterV(value: 'V', rowIndex: 2, order: 4),
  letterW(value: 'W', rowIndex: 0, order: 1),
  letterX(value: 'X', rowIndex: 2, order: 2),
  letterY(value: 'Y', rowIndex: 0, order: 5),
  letterZ(value: 'Z', rowIndex: 2, order: 1),
  backspace(value: 'Delete', rowIndex: 2, order: 0),
  enter(value: 'Enter', rowIndex: 2, order: 8);

  const KeyboardAction({
    this.value = '',
    this.rowIndex = 0,
    this.order = 0,
  });

  final String value;
  final int rowIndex;
  final int order;
}
