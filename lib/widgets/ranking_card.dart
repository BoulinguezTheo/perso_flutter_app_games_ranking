import 'package:flutter/material.dart';

class RankingCard extends StatelessWidget {
  final String playerName;
  final int victories;
  final int defeats;
  final int rank;

  const RankingCard({Key? key, required this.rank, required this.playerName, required this.victories, required this.defeats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 60,
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(69, 64, 82, 60),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$rank',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              playerName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              '$victories',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              '$defeats',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              displayScore(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String displayScore() {
    double score = victories / (victories + defeats);
    String inString = score.toStringAsFixed(3); // '2.35'
    return inString;
  }
}

//