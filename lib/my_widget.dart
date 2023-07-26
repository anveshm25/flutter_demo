import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyWidget extends StatelessWidget {
  final Color? color;
  final double? width;
  final double? height;
  const MyWidget({
    super.key,
    this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    print('Something to build...');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              // context.pushReplacementNamed('notifications',
              //     pathParameters: {'text': 'some text'});
              bool? result = await context.pushNamed('notifications',
                  pathParameters: {'text': 'some text'});
              print('Result: $result');
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      backgroundColor: Colors.purple.shade300,
      body: ElevatedButton(
        onPressed: () {
          // context.canPop()
          context.pop(true);
        },
        child: const Text('Button'),
      ),
    );
  }
}
