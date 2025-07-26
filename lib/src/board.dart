import 'dart:io';

import 'package:tic_tac_app/src/cell_type.dart';

class Board {
  late List<List<Cell>> cells;
  final int size;

  Board(this.size) {
    createCleanBoard();
  }

  void printBoard() {
    stdout.write(' ');
    for (int i = 0; i < size; i++) {
      stdout.write('${i + 1}'); // Вывод номера столбца;
    }
    stdout.write('\n');

    for (int i = 0; i < size; i++) {
      stdout.write('${i + 1}'); // Вывод номера строки
      for (int j = 0; j < size; j++) {
        switch (cells[i][j]) {
          case Cell.empty:
            stdout.write('. ');
          case Cell.cross:
            stdout.write('X ');
          case Cell.nought:
            stdout.write('0 ');
          case Cell.z:
            stdout.write('Z ');
        }
      }

      print('');
    }
  }

  bool _makeMove(int x, int y) {
    return cells[y][x] == Cell.empty;
  }

  bool setSymbol(int x, int y, Cell cellType) {
    if (_makeMove(x, y)) {
      cells[y][x] = cellType;
      return true;
    }

    return false;
  }

  bool checkWin(Cell player) {
    var numberOccupiedPlayerCells =
        size < 5 ? size : ((size * 90) / 100).floor();

    for (int i = 0; i < size; i++) {
      if (cells[i].where((cell) => cell == player).length ==
          numberOccupiedPlayerCells) {
        return true;
      }

      if (cells.where((row) => row[i] == player).length ==
          numberOccupiedPlayerCells) {
        return true;
      }
    }

    if (List.generate(size, (i) => cells[i][i])
            .where((cell) => cell == player)
            .length ==
        numberOccupiedPlayerCells) {
      return true;
    }

    if (List.generate(size, (i) => cells[i][size - i - 1])
            .where((cell) => cell == player)
            .length ==
        numberOccupiedPlayerCells) {
      return true;
    }

    return false;
  }

  bool checkDraw() {
    return cells.every((row) => row.every((cell) => cell != Cell.empty));
  }

  void createCleanBoard() {
    cells = List.generate(size, (_) => List.filled(size, Cell.empty));
  }
}
