import 'package:flutter/material.dart';

class SelectTeamMessage extends StatelessWidget {
  const SelectTeamMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Appuyez sur les "teams" pour sélectionner les vainqueurs et perdants',
        style: TextStyle(
          fontSize: 10,
          color: Colors.white60,
        ),
      ),
    );
  }
}
