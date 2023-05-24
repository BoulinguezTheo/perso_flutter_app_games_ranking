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
    _playerList.sort((a, b) {
      if (a.victories == 0 && a.defeats == 0) {
        return 1;
      } else if (b.victories == 0 && b.defeats == 0) {
        return -1;
      } else {
        return _calculateRatio(b).compareTo(_calculateRatio(a));
      }
    }
    );

    for (int i = 0; i < _playerList.length; i++) {
      _playerList[i].ranking = i + 1;
    }

    notifyListeners();
  }

  double _calculateRatio(Player player) {
    if (player.defeats == 0) {
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
