import 'package:flutter/material.dart';
import 'package:scaled_size/scaled_size.dart';

class TeamLabel extends StatelessWidget {
  final String teamLabel;
  final Color backgroundColor;

  const TeamLabel(
      {Key? key, required this.teamLabel, required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.vh),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, right: 20.0, bottom: 10.0, left: 20.0),
        child: Text(
          teamLabel,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
