import 'package:flutter/material.dart';
import 'package:flutter_demo/local_provider.dart';
import 'package:provider/provider.dart';

class Wid extends StatelessWidget {
  const Wid({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.read<LocalProvider>().greetings,
      style: const TextStyle(fontSize: 20),
    );
  }
}
