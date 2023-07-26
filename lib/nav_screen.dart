import 'package:flutter/material.dart';
import 'package:flutter_demo/my_custom_text.dart';
import 'package:go_router/go_router.dart';

import 'bottom_nav_bar.dart';

class NavScreen extends StatelessWidget {
  final StatefulNavigationShell child;
  const NavScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nav Screen'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.yellow.shade200,
        child: Column(
          children: [
            InkWell(
                onTap: () => {
                      context.pop(),
                      context.push('/first'),
                    },
                child: const MyCustomText(text: "text")),
            const MyCustomText(text: "text1"),
            const MyCustomText(text: "text2"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        child: child,
      ),
      body: child,
    );
  }
}
