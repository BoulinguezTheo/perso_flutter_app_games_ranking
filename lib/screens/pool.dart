import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/homepage_button.dart';
import '../widgets/homepage_ranking.dart';

class Pool extends StatelessWidget {
  const Pool({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(69, 64, 82, 60),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              HomepageRanking(),
              const Flexible(
                  child: HomepageButton(buttonLabel: 'NOUVELLE PARTIE')),
              const Flexible(
                  child: HomepageButton(buttonLabel: 'NOUVEAU JOUEUR')),
              const Flexible(
                  child: HomepageButton(buttonLabel: 'CLASSEMENT')),
            ],
          ),
        ),
      );
  }
  void onItemTapped(int index) {

  }
}