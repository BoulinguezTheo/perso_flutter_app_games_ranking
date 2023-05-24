import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPlayerButton extends StatelessWidget {
  const AddPlayerButton({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(50, 46, 59, 100),
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
      child: const Padding(
        padding: EdgeInsets.only(top: 10.0, right: 20.0, bottom: 10.0, left: 20.0),
        child: Text(
          'AJOUTER UN JOUEUR',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

}