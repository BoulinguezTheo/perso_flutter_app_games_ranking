import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/homepage_button.dart';
import '../widgets/homepage_ranking.dart';

class Pool extends StatefulWidget {
  const Pool({super.key});

  @override
  _Pool createState() => _Pool();
}

class _Pool extends State<Pool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(69, 64, 82, 60),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: HomepageRanking()
              ),
              const Expanded(
                flex: 1,
                  child: HomepageButton(buttonLabel: 'NOUVELLE PARTIE'),
                ),
              const Expanded(
                flex: 1,
                  child: HomepageButton(buttonLabel: 'NOUVEAU JOUEUR')),
              const Expanded(
                flex: 1,
                  child: HomepageButton(buttonLabel: 'CLASSEMENT')),
            ],
          ),
        ),
      );
  }

  void changeRoute(String s) {

  }

}