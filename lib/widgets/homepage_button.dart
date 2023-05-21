import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new_player.dart';

class HomepageButton extends StatefulWidget {
  final String buttonLabel;
  const HomepageButton({Key? key, required this.buttonLabel}) : super(key: key);

  @override
  _HomepageButton createState() => _HomepageButton();
}

class _HomepageButton extends State<HomepageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,  // use the context from the build method
          MaterialPageRoute(builder: (context) => NewPlayer()),
        );
      },
      child: Container(
        height: 90,
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
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
        child: Center(
          child: Text(
            widget.buttonLabel,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}