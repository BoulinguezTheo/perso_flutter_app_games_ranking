import 'package:flutter/material.dart';
import 'package:ranking_app/screens/pool.dart';
import 'package:ranking_app/widgets/homepage_button.dart';
import 'package:ranking_app/widgets/homepage_ranking.dart';
import 'package:ranking_app/widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const int startingSelectedIndex = 0;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(69, 64, 82, 60),
        body: const Pool(),
        bottomNavigationBar: Navbar(
          selectedIndex: startingSelectedIndex,
          onItemTapped: onItemTapped,
        ),
      ),
    );
  }
  void onItemTapped(int index) {

  }
}
