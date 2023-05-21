import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ranking_app/widgets/ranking_card.dart';
import '../models/player.dart';
import '../services/player_service.dart';

class HomepageRanking extends StatefulWidget {
  HomepageRanking() : super();

  @override
  _HomepageRanking createState() => _HomepageRanking();
}

class _HomepageRanking extends State<HomepageRanking> {
  var playerService = PlayerService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Player>>(
      future: playerService.getRanking(),
      builder: (BuildContext context, AsyncSnapshot<List<Player>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          var playerRanking = snapshot.data!;
          return Container(
            height: 400,
            margin: const EdgeInsets.all(20.0),
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
            child: ListView(
              children: [
                for (var i = 0; i < playerRanking.length; i++)
                  RankingCard(
                    playerName: playerRanking[i].name,
                    victories: playerRanking[i].victories,
                    defeats: playerRanking[i].defeats,
                    rank: i + 1,
                  )
              ],
            ),
          );
        }
      },
    );
  }
}
