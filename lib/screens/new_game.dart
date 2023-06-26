import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranking_app/models/player.dart';
import 'package:ranking_app/services/pool_service.dart';
import 'package:ranking_app/widgets/add_player_button.dart';
import 'package:ranking_app/widgets/end_game_button.dart';
import 'package:ranking_app/widgets/homepage_button.dart';
import 'package:ranking_app/widgets/team_label.dart';
import 'package:scaled_size/scaled_size.dart';

import '../providers/player_provider.dart';
import '../widgets/page_title_widget.dart';

class NewGame extends StatefulWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  _NewGame createState() => _NewGame();
}

class _NewGame extends State<NewGame> {
  final String playString = 'JOUER';
  final String teamSeparator = "VS";
  bool _canGameStart = false;

  @override
  Widget build(BuildContext context) {
    var playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    var remainingPlayers = [...playerProvider.playerList];
    resetSelectedPlayers();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Consumer<PoolService>(
            builder: (context, poolService, child) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 2.vh,
                  ),
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
                  SizedBox(
                    height: 2.vh,
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                        children: [
                          const TeamLabel(
                            teamLabel: 'Team 1',
                            backgroundColor: Color.fromRGBO(69, 64, 82, 100),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => _showPicker(
                                context, 'Team 1', remainingPlayers),
                            child: const AddPlayerButton(),
                          ),
                          displayPlayerInTeam('Team 1', poolService),
                          SizedBox(
                            height: 2.vh,
                          ),
                          PageTitleWidget(
                            title: teamSeparator,
                          ),
                          SizedBox(
                            height: 2.vh,
                          ),
                          GestureDetector(
                            onTap: () => _showPicker(
                                context, 'Team 2', remainingPlayers),
                            child: const AddPlayerButton(),
                          ),
                          displayPlayerInTeam('Team 2', poolService),
                          Spacer(),
                          const TeamLabel(
                            teamLabel: 'Team 2',
                            backgroundColor: Color.fromRGBO(69, 64, 82, 100),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.vh,
                  ),
                  const HomepageButton(buttonLabel: 'EQUIPES ALEATOIRES'),
                  IgnorePointer(
                    ignoring: !_canGameStart,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/pool-game');
                      },
                      child: DisableButton(
                          buttonLabel: playString,
                          isAvailableDisplay: _canGameStart),
                    ),
                  ),
                  SizedBox(
                    height: 2.vh,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void resetSelectedPlayers() {
    var poolService = Provider.of<PoolService>(context, listen: false);
    poolService.resetTeams();
  }

  void _showPicker(BuildContext context, String team, playerProvider) {
    Player selectedPlayer = playerProvider[0];
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
              selectedPlayer = playerProvider[index];
            },
            children: List<Widget>.generate(
              playerProvider.length,
              (int index) {
                return Text(
                  playerProvider[index].name,
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
      var poolService = Provider.of<PoolService>(context, listen: false);
      addPlayerToTeam(selectedPlayer, team, poolService, playerProvider);
    });
  }

  void addPlayerToTeam(
      Player player, String team, PoolService poolService, playerProvider) {
    if (team == 'Team 1') {
      poolService.addPlayerToTeamOne(player);
      playerProvider.remove(player);
    }
    if (team == 'Team 2') {
      poolService.addPlayerToTeamTwo(player);
      playerProvider.remove(player);
    }
    _setCanGameStartStatus(poolService);
  }

  void _setCanGameStartStatus(PoolService poolService) {
    if (poolService.teamOne.isNotEmpty && poolService.teamTwo.isNotEmpty) {
      _canGameStart = true;
    }
  }
}

Widget displayPlayerInTeam(String team, PoolService poolService) {
  if (team == 'Team 1' && poolService.teamOne.isNotEmpty) {
    return Column(
      children: [
        for (var player in poolService.teamOne)
          TeamLabel(
            teamLabel: player.name,
            backgroundColor: const Color.fromRGBO(69, 64, 82, 1.0),
          )
      ],
    );
  } else if (team == 'Team 2' && poolService.teamTwo.isNotEmpty) {
    return Column(
      children: [
        for (var player in poolService.teamTwo)
          TeamLabel(
            teamLabel: player.name,
            backgroundColor: const Color.fromRGBO(69, 64, 82, 1.0),
          )
      ],
    );
  } else {
    return Container();
  }
}
