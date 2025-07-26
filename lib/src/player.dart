import 'package:tic_tac_app/src/cell_type.dart';

class Player {
  int idActivePlayer = 1;
  Cell cellType;

  Player(this.cellType);

  void switchPlayer() {
    if (idActivePlayer == 3) {
      idActivePlayer = 1;
    } else {
      idActivePlayer++;
    }
    cellType = Cell.values[idActivePlayer];
  }

  String get symbol => cellSymbols[cellType]!;
}
