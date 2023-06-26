import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranking_app/providers/player_provider.dart';
import 'package:ranking_app/screens/new_game.dart';
import 'package:ranking_app/screens/new_player.dart';
import 'package:ranking_app/screens/pool.dart';
import 'package:ranking_app/screens/pool_game.dart';
import 'package:ranking_app/services/pool_service.dart';
import 'package:ranking_app/widgets/ranking.dart';
import 'package:scaled_size/scaled_size.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlayerProvider()),
        ChangeNotifierProvider(create: (_) => PoolService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int startingSelectedIndex = 0;
    return ScaledSize(builder: () {
      return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(69, 64, 82, 1),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Scaffold(
                body: Pool(),
              ),
          '/new-player': (context) => Scaffold(
                body: NewPlayer(),
              ),
          '/new-game': (context) => NewGame(),
          '/ranking': (context) => Ranking(),
          '/pool-game': (context) => PoolGame(),
        },
      );
    });
  }

  void onItemTapped(int index) {}
}
