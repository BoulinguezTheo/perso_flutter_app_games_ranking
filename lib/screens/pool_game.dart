import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranking_app/services/pool_service.dart';
import 'package:ranking_app/widgets/end_game_button.dart';
import 'package:ranking_app/widgets/page_title_widget.dart';
import 'package:ranking_app/widgets/select_team_message.dart';
import 'package:ranking_app/widgets/team_label.dart';
import 'package:scaled_size/scaled_size.dart';

class PoolGame extends StatefulWidget {
  const PoolGame({Key? key}) : super(key: key);

  @override
  PoolGameImpl createState() => PoolGameImpl();
}

class PoolGameImpl extends State<PoolGame> {
  final String pageTitle = 'PARTIE EN COURS';
  final String teamSeparator = 'VS';
  final String teamOne = 'Team 1';
  final String teamTwo = 'Team 2';
  final String endGame = 'TERMINER LA PARTIE';
  final Color _defaultTeamLabelBackgroundColor =
  const Color.fromRGBO(69, 64, 82, 1.0);
  Color _teamOneBackgroundColor = const Color.fromRGBO(69, 64, 82, 1.0);
  Color _teamTwoBackgroundColor = const Color.fromRGBO(69, 64, 82, 1.0);
  String? teamWinner;
  String? teamLooser;
  bool _endGameButtonStatus = false;

  @override
  Widget build(BuildContext context) {
    // var playerProvider = Provider.of<PlayerProvider>(context, listen: false);.
    return Scaffold(
      body: SafeArea(
        child: Consumer<PoolService>(
          builder: (context, poolService, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 3.vh,
                ),
                PageTitleWidget(title: pageTitle),
                SizedBox(
                  height: 3.vh,
                ),
                IntrinsicHeight(
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
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _setTeamsAttributs(teamOne);
                            });
                          },
                          child: TeamLabel(
                            teamLabel: teamOne,
                            backgroundColor: _teamOneBackgroundColor,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 2.vh,
                        ),
                        displayPlayerInTeam(teamOne, poolService),
                        SizedBox(
                          height: 2.vh,
                        ),
                        PageTitleWidget(
                          title: teamSeparator,
                        ),
                        SizedBox(
                          height: 3.vh,
                        ),
                        displayPlayerInTeam(teamTwo, poolService),
                        SizedBox(
                          height: 2.vh,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _setTeamsAttributs(teamTwo);
                            });
                          },
                          child: TeamLabel(
                            teamLabel: teamTwo,
                            backgroundColor: _teamTwoBackgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.vh,
                ),
                IgnorePointer(
                  ignoring: !_endGameButtonStatus,
                  child: GestureDetector(
                    onTap: () {
                      poolService.setWinnerAndLoser(
                          context, teamWinner, teamLooser);
                      poolService.resetTeams();
                      Navigator.pushNamed(context, '/');
                    },
                    child: EndGameButton(
                        buttonLabel: endGame,
                        isAvailableDisplay: _endGameButtonStatus),
                  ),
                ),
                SizedBox(
                  height: 2.vh,
                ),
                if (!_endGameButtonStatus) const SelectTeamMessage(),
              ],
            );
          },
        ),

      ),
    );
  }

  void _setTeamsAttributs(String team) {
    if (teamWinner == null && teamLooser == null) {
      teamWinner = team;
      team == teamOne ? _setTeamOneAttributs() : _setTeamTwoAttributs();
    } else if (teamWinner == team) {
      _resetTeamsAttributs();
    } else if (teamLooser == null) {
      teamLooser = team;
      team == teamOne ? _setTeamOneAttributs() : _setTeamTwoAttributs();
    } else {
      _resetTeamsAttributs();
    }
    _setEndGameButtonStatus();
  }

  void _setTeamOneAttributs() {
    teamWinner == teamOne
        ? _teamOneBackgroundColor = Colors.green
        : _teamOneBackgroundColor = Colors.red;
  }

  void _setTeamTwoAttributs() {
    teamWinner == teamTwo
        ? _teamTwoBackgroundColor = Colors.green
        : _teamTwoBackgroundColor = Colors.red;
  }

  void _resetTeamsAttributs() {
    teamWinner = null;
    teamLooser = null;
    _teamOneBackgroundColor = _defaultTeamLabelBackgroundColor;
    _teamTwoBackgroundColor = _defaultTeamLabelBackgroundColor;
  }

  void _setEndGameButtonStatus() {
    _endGameButtonStatus = teamLooser != null && teamWinner != null;
  }

  Widget displayPlayerInTeam(String team, PoolService poolService) {
    if (team == teamOne && poolService.teamOne.isNotEmpty) {
      return Column(
        children: <Widget>[
          for (var player in poolService.teamOne)
            TeamLabel(
              teamLabel: player.name,
              backgroundColor: _defaultTeamLabelBackgroundColor,
            ),
        ],
      );
    } else if (team == teamTwo && poolService.teamTwo.isNotEmpty) {
      return Column(
        children: <Widget>[
          for (var player in poolService.teamTwo)
            TeamLabel(
              teamLabel: player.name,
              backgroundColor: _defaultTeamLabelBackgroundColor,
            ),
        ],
      );
    } else {
      return Container();
    }
  }
}
