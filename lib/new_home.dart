import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewHome extends StatelessWidget {
  const NewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade200,
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed('homeChild');
          },
          child: const Text('Next Screen'),
        ),
      ),
    );
  }
}
