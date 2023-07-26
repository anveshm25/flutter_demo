import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeProvider extends ChangeNotifier {
  String message = "Hello, Anvesh!";
  int age = 24;

  changeValue(String name, int age, BuildContext context) {
    message = 'Hello, $name';
    this.age = age;
    notifyListeners();
    // context.go('/notifications/:text');
  }

  changeName(String name) {
    message = 'Hello, $name';
    notifyListeners();
  }

  changeAge(int age) {
    this.age = age;
    notifyListeners();
  }

  function() async {
    ///
    return 1;
  }
}
