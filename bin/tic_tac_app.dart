import 'package:tic_tac_app/tic_tac_toe.dart';
import 'dart:io';

void startGame() {
  int? size;
  while (true) {
    stdout.write('Enter the size of the board 5-9: ');
    size = int.tryParse(stdin.readLineSync()!);
    size ??= 5;
    if (size < 5 || size > 9) {
      continue;
    }
    break;
  }

  Board board = Board(size);
  Player player = Player(Cell.cross);
  Game game = Game(board, player);
  game.play();

  // StringBuffer buffer = StringBuffer();
  stdout.write('Do you want to restart the game? (y/n): ');
  String? inputAfterUpdateStatus = stdin.readLineSync();
  if (inputAfterUpdateStatus == null) {
    print('Invalid input. Please try again');
  }

  if (inputAfterUpdateStatus == 'y') {
    startGame();
  }
}

void main() {
  startGame();
}

// void main() {
//   while (!initBoard()) {
//     print('Invalid size, please enter again');
//   }

//   play();
//   reloadOrCancelGame();
// }

// import 'dart:io';
// import 'dart:math';

// // Фигуры в клетке поля
// const int empty = 0; // Пусто
// const int cross = 1; // X
// const int nought = 2; // 0

// // Состояние игрового процесса
// const int playing = 0; // Статус игры
// const int draw = 0; // Ничья
// const int crossWin = 2; // Победа X
// const int noightWin = 3; // Победа 0
// const int quit = 3; // Выход

// void game() {
//   late List<List<int>> board;
//   int boardSize = 3;
//   int state = playing;
//   int currentPlayer = Random().nextBool() ? cross : nought;
//   print('Player ${currentPlayer == cross ? 'X' : '0'} goes first.');

//   while (true) {
//     stdout.write('Enter the size the board (3-9): ');
//     int? size = int.tryParse(stdin.readLineSync()!);
//     size ??= boardSize;
//     if (size < 3 || size > 9) {
//       print('Invalid size, please enter again');
//       continue;
//     }
//     boardSize = size;
//     board = List.generate(size, (_) => List.filled(boardSize, empty));
//     break;
//   }

//   // Вывод в терминал состояние игрового поля
//   stdout.write(' ');
//   for (int i = 0; i < boardSize; i++) {
//     stdout.write('${i + 1}'); // Вывод номера столбца;
//   }
//   stdout.write('\n');

//   for (int i = 0; i < boardSize; i++) {
//     stdout.write('${i + 1}'); // Вывод номера строки
//     for (int j = 0; j < boardSize; j++) {
//       switch (board[i][j]) {
//         case empty:
//           stdout.write('. ');
//         case cross:
//           stdout.write('X ');
//         case nought:
//           stdout.write('0 ');
//       }
//     }

//     print('');
//   }

//   while (state == playing) {
//     StringBuffer buffer = StringBuffer();
//     buffer.write("${currentPlayer == cross ? 'X' : '0'}'s turn.");
//     buffer.write('Enter row and column (e.g 1 2): ');
//     stdout.write(buffer.toString());

//     bool validInput = false;
//     int? x, y;

//     while (!validInput) {
//       String? input = stdin.readLineSync();
//       if (input == null) {
//         print('Invalid input. Please try again');
//         continue;
//       }

//       if (input == 'q') {
//         state = quit;
//         break;
//       }

//       var inputList = input.split(' ');
//       if (inputList.length != 2) {
//         print('Invalid input. Please try again');
//         continue;
//       }

//       x = int.tryParse(inputList[1]);
//       y = int.tryParse(inputList[0]);

//       if (x == null || y == null) {
//         print('Invalig input. Please try again');
//         continue;
//       }

//       if (x < 1 || x > boardSize || y < 1 || y > boardSize) {
//         print('Invalig input. Please try again');
//         continue;
//       }

//       x -= 1;
//       y -= 1;

//       if (board[y][x] == empty) {
//         board[y][x] = currentPlayer;
//         // Поиск наличия выйгрышной комбинации
//         // Последовательно в тело данного блока if

//         bool winFound = false;
//         for (int i = 0; i < boardSize; i++) {
//           if (board[i].every((cell) => cell == currentPlayer)) {
//             winFound = true;
//             break;
//           }

//           if (board.every((row) => row[i] == currentPlayer)) {
//             winFound = true;
//             break;
//           }
//         }

//         // Проверка по главной диагонали
//         // [
//         //   board[0][0],
//         //   board[1][1],
//         //   board[2][2]
//         // ]
//         if (!winFound) {
//           if (List.generate(boardSize, (i) => board[i][i])
//               .every((cell) => cell == currentPlayer)) {
//             winFound = true;
//           }
//         }

//         // Обратная диагональ
//         if (!winFound) {
//           if (List.generate(boardSize, (i) => board[i][boardSize - i - 1])
//               .every((cell) => cell == currentPlayer)) {
//             winFound = true;
//           }
//         }

//         // Определение победителя
//         if (winFound) {
//           state = currentPlayer == cross ? crossWin : noightWin;
//         } else if (board.every((row) => row.every((cell) => cell != empty))) {
//           // Проверка на ничью
//           state = draw;
//         }

//         stdout.write(' ');
//         for (int i = 0; i < boardSize; i++) {
//           stdout.write('${i + 1} '); // Вывод номера строки
//           for (int j = 0; j < boardSize; j++) {
//             switch (board[i][j]) {
//               case empty:
//                 stdout.write('. ');
//               case cross:
//                 stdout.write('X ');
//               case nought:
//                 stdout.write('0 ');
//             }
//           }
//           print('');
//         }

//         switch (state) {
//           case crossWin:
//             stdout.writeln('X wins! ');
//             break;
//           case noightWin:
//             stdout.writeln('0 wins! ');
//             break;
//           case draw:
//             stdout.writeln('It is a draw!');
//             break;
//           default:
//             break;
//         }

//         currentPlayer = currentPlayer == cross ? nought : cross;
//         validInput = true;
//       } else {
//         stdout.writeln('This cell is already occupied!');
//       }
//     }
//   }
//   print('If can reload game, pls enter y in console: y');
//   String? code = stdin.readLineSync();
//   if (code == 'y') {
//     game();
//   } else {
//     print('Please rate the app (1-5): ');
//     String? rate = stdin.readLineSync();
//     if (rate == null) return;
//     int? rateNumber = int.tryParse(rate);
//     if (rateNumber != null && rateNumber >= 1 && rateNumber <= 5) {
//       String stars = '⭐' * rateNumber;
//       print('Your rating: $stars'); // Пример: ⭐⭐⭐⭐
//     } else {
//       print('Invalid input. Please enter a number from 1 to 5.');
//     }
//   }
// }
