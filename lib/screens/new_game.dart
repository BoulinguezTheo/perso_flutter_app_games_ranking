import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranking_app/models/player.dart';
import 'package:ranking_app/services/pool_service.dart';
import 'package:ranking_app/widgets/add_player_button.dart';
import 'package:ranking_app/widgets/team_label.dart';

import '../providers/player_provider.dart';

class NewGame extends StatefulWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  _NewGame createState() => _NewGame();
}

class _NewGame extends State<NewGame> {
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
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.subdirectory_arrow_left_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          'NOUVELLE PARTIE',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                            offset:
                            const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        //TODO : VOIR MAQUETTE
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TeamLabel(teamLabel: 'Team 1'),
                          GestureDetector(
                            onTap: () => _showPicker(context, 'Team 1'),
                            child: const AddPlayerButton(),
                          ),
                          displayPlayerInTeam('Team 1', poolService),
                          const Text(
                            'VS',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          const TeamLabel(teamLabel: 'Team 2'),
                          GestureDetector(
                            onTap: () => _showPicker(context, 'Team 2'),
                            child: const AddPlayerButton(),
                          ),
                          displayPlayerInTeam('Team 2', poolService),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
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
                            offset:
                            const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          if (poolService.teamOne.isNotEmpty && poolService.teamTwo.isNotEmpty) {
                            Navigator.pushNamed(context, '/pool-game');
                          }
                        },
                        child: const Center(
                          child: Text(
                            'JOUER',
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

  void _showPicker(BuildContext context, String team) {
    var playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    Player? _selectedPlayer;
    double screenHeight = MediaQuery.of(context).size.height;

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: screenHeight / 3,
          child: CupertinoPicker(
            backgroundColor: const Color.fromRGBO(50, 46, 59, 1),
            itemExtent: 30,
            onSelectedItemChanged: (int index) {
              _selectedPlayer = playerProvider.playerList[index];
            },
            children: List<Widget>.generate(
              playerProvider.playerList.length,
                  (int index) {
                return Text(
                  playerProvider.playerList[index].name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        );
      },
    ).then((_) {
      if (_selectedPlayer != null) {
        var poolService = Provider.of<PoolService>(context, listen: false);
        addPlayerToTeam(_selectedPlayer!, team, poolService);
        _selectedPlayer = null;
      }
    });
  }

  void addPlayerToTeam(Player player, String team, PoolService poolService) {
    if (team == 'Team 1') {
      poolService.addPlayerToTeamOne(player);
    }
    if (team == 'Team 2') {
      poolService.addPlayerToTeamTwo(player);
    }
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