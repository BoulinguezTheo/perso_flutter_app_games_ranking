import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranking_app/providers/player_provider.dart';  // Add this import

import '../models/player.dart';

class PoolService with ChangeNotifier {
  var teamOne = [];
  var teamTwo = [];

  void addPlayerToTeamOne(Player player) {
    teamOne.add(player);
    notifyListeners();
  }

  void addPlayerToTeamTwo(Player player) {
    teamTwo.add(player);
    notifyListeners();
  }

  void resetTeams() {
    teamOne = [];
    teamTwo = [];
  }

  String? winnerTeam;
  String? loserTeam;

  void setWinnerAndLoser(BuildContext context, String? winner, String? loser) {
    winnerTeam = winner;
    loserTeam = loser;
    // Get the PlayerProvider
    var playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    // Update the stats of the winning and losing teams
    // if (winner != null) {
    //   playerProvider.incrementWins(winner);
    // }
    // if (loser != null) {
    //   playerProvider.incrementLosses(loser);
    // }
    if (winner == 'Team 1') {
      playerProvider.incrementsVictories(teamOne);
      playerProvider.incrementsDefeats(teamTwo);
    } else {
      playerProvider.incrementsVictories(teamTwo);
      playerProvider.incrementsDefeats(teamOne);
    }
    playerProvider.updateRanking();
  }

}
