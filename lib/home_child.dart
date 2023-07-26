import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeChild extends StatelessWidget {
  const HomeChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.orange.shade200,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Scaffold.of(context).closeDrawer();
            context.push('/first');
            // context.pop();
          },
          child: const Text('Next Screen'),
        ),
      ),
    );
  }
}
