import 'package:flutter/material.dart';
import 'package:scaled_size/scaled_size.dart';

class EndGameButton extends StatelessWidget {
  final String buttonLabel;

  const EndGameButton({super.key, required this.buttonLabel});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 7.vh,
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        padding: const EdgeInsets.all(15.0),
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
            buttonLabel,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
