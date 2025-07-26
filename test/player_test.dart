import 'package:test/test.dart';
import 'package:tic_tac_app/tic_tac_toe.dart';

void main() {
  group('Player test', () {
    var player = Player(Cell.cross);
    test('Check cell type', () {
      expect(player.symbol, cellSymbols[Cell.cross]);
    });

    test('Check switch player', () {
      player.switchPlayer();
      expect(player.symbol, isNot(cellSymbols[Cell.cross]));
    });
  });
}
