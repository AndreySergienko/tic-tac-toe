// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:async/async.dart';
// import 'package:test/test.dart';
// import 'package:tic_tac_app/tic_tac_toe.dart';

// // typedef Cell = int; // Тип клетки поля
// // typedef GameState = int; // Тип состояния игрового процесса

// void main() {
//   // const Cell empty = 0;
//   // const Cell cross = 1;
//   // const Cell nought = 2;

// // Состояние игрового процесса

//   // const GameState playing = 0;
//   // const GameState draw = 1;
//   // const GameState crossWin = 2;
//   // const GameState noughtWin = 3;
//   // const GameState quit = 3;

//   group('Проверка инициализации доски', () {
//     test('Размер доски меньше положенного ', () {
//       Board board = Board(4);
//       Player player = Player(Cell.cross);
//       Game game = Game(board, player);
//       game.play();
//       expect(value, equals(false));
//     });

//     test('Размер доски больше положенного ', () {
//       var value = generateBoard(10);
//       expect(value, equals(false));
//     });

//     test('Размер доски оптимальный', () {
//       var value = generateBoard(3);
//       expect(value, equals(true));
//     });
//   });

//   group('Проверка определение победителя', () {
//     test('Линейно CROSS', () {
//       boardSize = 3;
//       board = [
//         [cross, cross, cross],
//         [empty, empty, nought],
//         [nought, nought, empty],
//       ];

//       var correct = checkWin(cross);
//       expect(correct, equals(true));

//       var incorrect = checkWin(nought);
//       expect(incorrect, equals(false));
//     });

//     test('По диагонали CROSS', () {
//       boardSize = 3;
//       board = [
//         [cross, empty, empty],
//         [empty, cross, nought],
//         [nought, nought, cross],
//       ];
//       var correct = checkWin(cross);
//       expect(correct, equals(true));

//       var incorrect = checkWin(nought);
//       expect(incorrect, equals(false));
//     });

//     test('По обратной диагонали Nought', () {
//       boardSize = 3;
//       board = [
//         [cross, empty, nought],
//         [empty, nought, empty],
//         [nought, cross, cross],
//       ];
//       var correct = checkWin(nought);
//       expect(correct, equals(true));

//       var incorrect = checkWin(cross);
//       expect(incorrect, equals(false));
//     });

//     test('Ничья', () {
//       boardSize = 3;
//       board = [
//         [cross, empty, nought],
//         [nought, empty, cross],
//         [nought, empty, cross],
//       ];
//       var noughtLose = checkWin(nought);
//       expect(noughtLose, equals(false));

//       var crossLose = checkWin(cross);
//       expect(crossLose, equals(false));
//     });
//   });
// }
