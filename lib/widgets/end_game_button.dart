import 'package:flutter/material.dart';
import 'package:scaled_size/scaled_size.dart';

class DisableButton extends StatelessWidget {
  final String buttonLabel;
  bool isAvailableDisplay;

  DisableButton(
      {super.key, required this.buttonLabel, required this.isAvailableDisplay});

  @override
  Widget build(BuildContext context) {
    if (isAvailableDisplay) {
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
    } else {
      return FittedBox(
        child: Container(
          height: 7.vh,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(225, 225, 225, 100),
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
                color: Colors.white60,
              ),
            ),
          ),
        ),
      );
    }
  }
}
