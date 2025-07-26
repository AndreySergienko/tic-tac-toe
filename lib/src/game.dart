import 'dart:io';

import 'package:tic_tac_app/src/board.dart';
import 'package:tic_tac_app/src/cell_type.dart';
import 'package:tic_tac_app/src/game_state.dart';
import 'package:tic_tac_app/src/player.dart';

class Game {
  final Board board;
  final Player currentPlayer;
  GameState state = GameState.playing;

  Game(this.board, this.currentPlayer);

  void updateState() {
    if (board.checkWin(Cell.cross)) {
      state = GameState.crossWin;
    } else if (board.checkWin(Cell.nought)) {
      state = GameState.noughtWin;
    } else if (board.checkWin(Cell.z)) {
      state = GameState.zWin;
    } else if (board.checkDraw()) {
      state = GameState.draw;
    }
  }

  void play() {
    while (state == GameState.playing) {
      board.printBoard();
      StringBuffer buffer = StringBuffer();
      buffer.write("${Cell.values[currentPlayer.idActivePlayer]}'s turn.");
      buffer.write('Enter row and column (e.g 1 2): ');
      stdout.write(buffer.toString());

      bool validInput = false;
      int? x, y;
      while (!validInput) {
        String? input = stdin.readLineSync();
        if (input == null) {
          print('Invalid input. Please try again');
          continue;
        }

        if (input == 'q') {
          state = GameState.quit;
          break;
        }

        if (input == 'clear') {
          board.createCleanBoard();
          board.printBoard();
          stdout.write("${Cell.values[currentPlayer.idActivePlayer]}'s turn.");
          stdout.write('Enter row and column (e.g 1 2): ');
          continue;
        }

        // if (input.contains('/more')) {
        //   var addedSize = int.parse(input.split(' ')[1]);
        //   createMoreCell(addedSize);
        //   continue;
        // }

        var inputList = input.split(' ');
        if (inputList.length != 2) {
          print('Invalid input. Please try again');
          continue;
        }

        x = int.tryParse(inputList[1]);
        y = int.tryParse(inputList[0]);

        if (x == null || y == null) {
          print('Invalig input. Please try again');
          continue;
        }

        if (x < 1 || x > board.size || y < 1 || y > board.size) {
          print('Invalig input. Please try again');
          continue;
        }

        x -= 1;
        y -= 1;

        if (board.setSymbol(x, y, currentPlayer.cellType)) {
          updateState();
          currentPlayer.switchPlayer();
          validInput = true;
        } else {
          stdout.writeln('This cell is already occupied!');
        }
      }
    }

    board.printBoard();
    switch (state) {
      case GameState.crossWin:
        stdout.writeln('X wins! ');
        break;
      case GameState.noughtWin:
        stdout.writeln('0 wins! ');
        break;
      case GameState.zWin:
        stdout.writeln('Z wins! ');
      case GameState.draw:
        stdout.writeln('It is a draw!');
        break;
      default:
        break;
    }
  }
}
