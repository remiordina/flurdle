enum KeyboardAction {
  letterQ(value: 'Q', rowIndex: 0, order: 0),
  letterW(value: 'W', rowIndex: 0, order: 1),
  letterE(value: 'E', rowIndex: 0, order: 2),
  letterR(value: 'R', rowIndex: 0, order: 3),
  letterT(value: 'T', rowIndex: 0, order: 4),

  letterY(value: 'Y', rowIndex: 1, order: 0),
  letterU(value: 'U', rowIndex: 1, order: 1),
  letterI(value: 'I', rowIndex: 1, order: 2),
  letterO(value: 'O', rowIndex: 1, order: 3),
  letterP(value: 'P', rowIndex: 1, order: 4),

  letterA(value: 'A', rowIndex: 2, order: 0),
  letterS(value: 'S', rowIndex: 2, order: 1),
  letterD(value: 'D', rowIndex: 2, order: 2),
  letterF(value: 'F', rowIndex: 2, order: 3),
  letterG(value: 'G', rowIndex: 2, order: 4),

  letterH(value: 'H', rowIndex: 3, order: 1),
  letterJ(value: 'J', rowIndex: 3, order: 2),
  letterK(value: 'K', rowIndex: 3, order: 3),
  letterL(value: 'L', rowIndex: 3, order: 4),
  letterZ(value: 'Z', rowIndex: 3, order: 5),

  letterX(value: 'X', rowIndex: 4, order: 6),
  letterC(value: 'C', rowIndex: 4, order: 7),
  letterV(value: 'V', rowIndex: 4, order: 4),
  letterB(value: 'B', rowIndex: 4, order: 5),
  letterN(value: 'N', rowIndex: 4, order: 6),
  letterM(value: 'M', rowIndex: 5, order: 7),

  backspace(value: 'Delete', rowIndex: 5, order: 0),
  enter(value: 'Enter', rowIndex: 5, order: 8);

  const KeyboardAction({
    this.value = '',
    this.rowIndex = 0,
    this.order = 0,
  });

  final String value;
  final int rowIndex;
  final int order;
}
