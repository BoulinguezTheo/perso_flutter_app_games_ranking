import 'package:flutter/foundation.dart';
import '../models/player.dart';

class PlayerProvider with ChangeNotifier {
  List<Player> _playerList = [];

  List<Player> get playerList => _playerList;

  void addPlayer(String newPlayerName) {
    print(newPlayerName);
    int initValues = 0;
    _playerList.add(Player(newPlayerName, initValues, initValues, _playerList.length));
    notifyListeners();  // Notifies all the listening widgets about change
  }

  void deletePlayer() {
    // TODO : method to delete player
  }

  void updateRanking() {
    // Sort the player list based on the victory-to-defeat ratio (descending order)
    _playerList.sort((a, b) => _calculateRatio(b).compareTo(_calculateRatio(a)));

    // Update the rankings based on the sorted order
    for (int i = 0; i < _playerList.length; i++) {
      _playerList[i].ranking = i + 1;
    }

    // Notify listeners
    notifyListeners();
  }

  double _calculateRatio(Player player) {
    if (player.defeats == 0) {
      // Avoid division by zero
      return double.infinity;
    }
    return player.victories / player.defeats;
  }

  void incrementsVictories(List<dynamic> playerList) {
    for (var winingPlayer in playerList) {
      var player = _playerList.firstWhere(
              (player) => winingPlayer.name == player.name
      );
      player.victories++;
    }
    notifyListeners();
  }

  void incrementsDefeats(List<dynamic> playerList) {
    for (var losingPlayer in playerList) {
      var player = _playerList.firstWhere(
              (player) => losingPlayer.name == player.name
      );
      player.defeats++;
    }
    notifyListeners();
  }
}
