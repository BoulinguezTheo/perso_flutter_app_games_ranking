import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranking_app/providers/player_provider.dart';
import 'package:ranking_app/screens/pool.dart';
import 'package:ranking_app/widgets/homepage_button.dart';
import 'package:ranking_app/widgets/homepage_ranking.dart';
import 'package:ranking_app/widgets/navbar.dart';
import 'package:ranking_app/screens/new_game.dart';
import 'package:ranking_app/widgets/new_player.dart';
import 'package:ranking_app/widgets/ranking.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PlayerProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const int startingSelectedIndex = 0;
    return ChangeNotifierProvider(
      create: (_) => PlayerProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Scaffold(
            backgroundColor: Color.fromRGBO(69, 64, 82, 60),
            body: Pool(),
            // bottomNavigationBar: Navbar(
            //   selectedIndex: startingSelectedIndex,
            //   onItemTapped: onItemTapped,
            // ),
          ),
          '/new-player': (context) => NewPlayer(),
          '/new-game' : (context) => NewGame(),
          '/ranking' : (context) => Ranking(),
        },
      ),
    );
  }
  void onItemTapped(int index) {

  }
}
