import 'package:flutter/material.dart';

import '../services/player_service.dart';

class NewPlayer extends StatefulWidget {
  NewPlayer() : super();

  @override
  _NewPlayer createState() => _NewPlayer();
}

class _NewPlayer extends State<NewPlayer> {
  final playerService = PlayerService();
  var playerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(69, 64, 82, 60),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 280,
            width: double.infinity,
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(38, 35, 46, 100),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.subdirectory_arrow_left_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      'NOUVEAU JOUEUR',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  // padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(69, 64, 82, 60),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: TextField(
                      controller: playerNameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'NOM DU JOUEUR',
                        hintStyle: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    playerService.addPlayer(playerNameController.text);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(69, 64, 82, 60),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Ajouter',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
