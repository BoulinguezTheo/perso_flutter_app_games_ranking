import 'package:flutter/foundation.dart';
import '../models/player.dart';

class PlayerProvider with ChangeNotifier {
  List<Player> _playerList = [];

  List<Player> get playerList => _playerList;

  void addPlayer(String newPlayerName) {
    print(newPlayerName);
    int initValues = 0;
    _playerList.add(Player(newPlayerName, initValues, initValues));
    notifyListeners();  // Notifies all the listening widgets about change
  }

  void deletePlayer() {
    // TODO : method to delete player
  }

  void updateRanking() {
    //TODO : method to update the ranking
  }
}
