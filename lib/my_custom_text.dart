import 'package:flutter/material.dart';

class MyCustomText extends StatelessWidget {
  const MyCustomText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.yellow,
    );
    return Text(
      text,
      style: style,
    );
  }
}
