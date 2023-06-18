import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranking_app/services/pool_service.dart';
import 'package:ranking_app/widgets/team_label.dart';

import '../providers/player_provider.dart';

class PoolGame extends StatefulWidget {
  const PoolGame({Key? key}) : super(key: key);

  @override
  _PoolGame createState() => _PoolGame();
}

class _PoolGame extends State<PoolGame> {
  String? teamWinner;
  String? teamLooser;

  @override
  Widget build(BuildContext context) {
    var playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Consumer<PoolService>(
            builder: (context, poolService, child) {
              return Column(
                children: <Widget>[
                  Expanded(
                    flex: 9,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(38, 35, 46, 100),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (teamWinner == null) {
                                  teamWinner = 'Team 1';
                                } else if (teamWinner != 'Team 1' && teamLooser == null) {
                                  teamLooser = 'Team 1';
                                } else if (teamWinner == 'Team 1') {
                                  teamWinner = null;
                                } else if (teamLooser == 'Team 1') {
                                  teamLooser = null;
                                }
                              });
                            },
                            child: TeamLabel(
                              teamLabel: 'Team 1',
                              backgroundColor: teamWinner == 'Team 1' ? Colors.green : teamLooser == 'Team 1' ? Colors.red : Colors.transparent,
                            ),

                          ),
                          displayPlayerInTeam('Team 1', poolService),
                          const Text(
                            'VS',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          displayPlayerInTeam('Team 2', poolService),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (teamWinner == null) {
                                  teamWinner = 'Team 2';
                                } else if (teamWinner != 'Team 2' && teamLooser == null) {
                                  teamLooser = 'Team 2';
                                } else if (teamWinner == 'Team 2') {
                                  teamWinner = null;
                                } else if (teamLooser == 'Team 2') {
                                  teamLooser = null;
                                }
                              });
                            },
                            child: TeamLabel(
                              teamLabel: 'Team 2',
                              backgroundColor: teamWinner == 'Team 2' ? Colors.green : teamLooser == 'Team 2' ? Colors.red : Colors.transparent,
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20.0
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(38, 35, 46, 100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                            poolService.setWinnerAndLoser(context, teamWinner, teamLooser);
                            poolService.resetTeams();
                            Navigator.pushNamed(context, '/');
                        },
                        child: const Center(
                          child: Text(
                            'TERMINER LA PARTIE',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget displayPlayerInTeam(String team, PoolService poolService) {
    if (team == 'Team 1' && poolService.teamOne.isNotEmpty) {
      return Column(
        children: [
          for (var player in poolService.teamOne)
            TeamLabel(teamLabel: player.name)
        ],
      );
    } else if (team == 'Team 2' && poolService.teamTwo.isNotEmpty) {
      return Column(
        children: [
          for (var player in poolService.teamTwo)
            TeamLabel(teamLabel: player.name)
        ],
      );
    } else {
      return Container();
    }
  }
}
