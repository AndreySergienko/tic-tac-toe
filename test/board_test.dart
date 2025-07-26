import 'package:test/test.dart';
import 'package:tic_tac_app/tic_tac_toe.dart';

void main() {
  group('Board test', () {
    var board = Board(3);

    test('Set symbol is free', () {
      expect(true, board.setSymbol(1, 1, Cell.cross));
    });

    test('Set symbol is not free', () {
      expect(false, board.setSymbol(1, 1, Cell.cross));
    });

    test('Check win horizontal', () {
      board.setSymbol(0, 0, Cell.cross);
      board.setSymbol(0, 1, Cell.cross);
      board.setSymbol(0, 2, Cell.cross);
      expect(true, board.checkWin(Cell.cross));
    });

    test('Check lose horizontal', () {
      expect(false, board.checkWin(Cell.nought));
    });

    test('Check draw status', () {
      board.setSymbol(1, 0, Cell.cross);
      board.setSymbol(1, 1, Cell.cross);
      board.setSymbol(1, 2, Cell.cross);
      board.setSymbol(2, 0, Cell.cross);
      board.setSymbol(2, 1, Cell.cross);
      board.setSymbol(2, 2, Cell.cross);

      expect(true, board.checkDraw());
    });

    test('Check clean board', () {
      board.createCleanBoard();
      expect(false, board.checkDraw());
    });
  });
}
