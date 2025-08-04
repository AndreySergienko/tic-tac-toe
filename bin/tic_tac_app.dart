import 'package:tic_tac_app/tic_tac_toe.dart';
import 'dart:io';

void main() {
  var saver = JsonGameStateWorker();
  int? size;

  print('1 - load game');
  print('2 - new game');
  print('q - quit');

  var input = stdin.readLineSync()!;
  switch (input) {
    case '1':
    Game? game;
    while(true) {
      print('Input fileName: ');
      String? fileName = stdin.readLineSync();
      if (fileName == null) {
        print('Invalid input');
        continue;
      } 
      game = saver.loadGame(fileName);
      if (game != null) {
        break;
      } else {
        print('Game not found');
      }
    }
    game.play();
    case '2':
      while(true) {
      print('Enter the size of the board (3-9): ');
     size = int.tryParse(stdin.readLineSync()!);
     size ??= 3;
      if (size < 3 || size > 9) {
        print('Invalid input');
        continue;
      }
      break;
    }
    Board board = Board(size);
    Player player = Player(Cell.cross);
    Game game = Game(board, player, saver);
    game.play();
    case 'q':
    
    case _:
    print('Exit..  ');
    break;
  }  
}

// void startGame() {
//   int? size;
//   while (true) {
//     stdout.write('Enter the size of the board 5-9: ');
//     size = int.tryParse(stdin.readLineSync()!);
//     size ??= 5;
//     if (size < 5 || size > 9) {
//       continue;
//     }
//     break;
//   }

//   Board board = Board(size);
//   Player player = Player(Cell.cross);
//   Game game = Game(board, player);
//   game.play();

//   // StringBuffer buffer = StringBuffer();
//   stdout.write('Do you want to restart the game? (y/n): ');
//   String? inputAfterUpdateStatus = stdin.readLineSync();
//   if (inputAfterUpdateStatus == null) {
//     print('Invalid input. Please try again');
//   }

//   if (inputAfterUpdateStatus == 'y') {
//     startGame();
//   }
// }

// void main() {
//   startGame();
// }