import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RowColumn extends StatefulWidget {
  const RowColumn({super.key});

  @override
  State<RowColumn> createState() => _RowColumnState();
}

class _RowColumnState extends State<RowColumn> {
  int totalItem = 10;
  // TextEditingController _textEditingController = TextEditingController();
  bool showPasswords = false;
  String value = '';
  // final _formKey = GlobalKey<FormState>();
  Color color = Colors.red;
  late Future<String> future;
  ValueNotifier<String> myValue = ValueNotifier('Hello');
  @override
  void initState() {
    future = fun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build function');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            color = Colors.green;
          });
        },
      ),
      body: Column(
        children: [
          Container(
            color: color,
            height: 200,
          ),
          MaterialButton(
            onPressed: () async {
              // print('MaterialButton');

              // });

              // bool? result = await context.pushNamed('anvesh');
              // print('Result is $result');
              context.go('/home');
              // context.go('/first');
            },
            child: const Text('Press'),
          )
        ],
      ),
    );
  }

  Future<String> fun() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Some string from the future';
  }

  @override
  void dispose() {
    super.dispose();
  }
}
