import 'package:test/test.dart';
import 'package:tic_tac_app/src/game_state.dart';
import 'package:tic_tac_app/tic_tac_toe.dart';

void main() {
  group('Game test', () {
    var board = Board(3);
    var player = Player(Cell.cross);
    var game = Game(board, player);
    test('Check start state', () {
      expect(GameState.playing, game.state);
    });

    test('Check win horizontal', () {
      board.setSymbol(0, 0, Cell.cross);
      board.setSymbol(1, 0, Cell.cross);
      board.setSymbol(2, 0, Cell.cross);
      game.updateState();
      expect(GameState.crossWin, game.state);
    });
  });
}
