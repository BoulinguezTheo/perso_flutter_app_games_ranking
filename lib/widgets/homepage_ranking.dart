import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranking_app/widgets/ranking_card.dart';
import '../providers/player_provider.dart';

class HomepageRanking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the player provider from the context
    return Consumer<PlayerProvider>(
      builder: (context, playerProvider, child) {
        return Container(
          margin: const EdgeInsets.all(20.0),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: playerProvider.playerList.length,
              itemBuilder: (ctx, i) => RankingCard(
                playerName: playerProvider.playerList[i].name,
                victories: playerProvider.playerList[i].victories,
                defeats: playerProvider.playerList[i].defeats,
                rank: i + 1,
              ),
            ),
          ),
        );
      },
    );
  }
}
