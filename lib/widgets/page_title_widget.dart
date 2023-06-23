import 'package:flutter/material.dart';

class PageTitleWidget extends StatelessWidget {
  final String title;

  const PageTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30,
        color: Colors.white,
      ),
    );
  }
}
