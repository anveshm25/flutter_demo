import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final StatefulNavigationShell child;

  const BottomNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: child.currentIndex,
      onTap: (int value) =>
          child.goBranch(value, initialLocation: child.currentIndex == value),
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Colors.blue,
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.blue,
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.blue,
          icon: Icon(Icons.settings),
          label: 'settings',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.blue,
          icon: Icon(Icons.person),
          label: 'person',
        ),
      ],
    );
  }
}
