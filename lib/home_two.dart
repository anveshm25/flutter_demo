import 'package:flutter/material.dart';
import 'package:flutter_demo/home_provider.dart';
import 'package:flutter_demo/local_provider.dart';
import 'package:flutter_demo/second_provider.dart';
import 'package:flutter_demo/wid.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeTow extends StatefulWidget {
  const HomeTow({super.key});

  @override
  State<HomeTow> createState() => _HomeTowState();
}

class _HomeTowState extends State<HomeTow> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeProvider>().changeValue("name", 1, context);
    });
    // context.read<HomeProvider>().changeValue("name", 1, context);
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider p1 = context.read<HomeProvider>();
    SecondProvider s = context.read<SecondProvider>();
    // print(p1.message);
    return Scaffold(
      body: Selector<HomeProvider, int>(
        selector: (context, provider) => provider.age,
        builder: (context, value, child) {
          return Column(
            children: [
              Text(p1.message),
              // Text(context.read<LocalProvider>().greetings),
              const Wid(),
              Text(
                value.toString(),
              ),
              MaterialButton(
                onPressed: () {
                  p1.changeAge(
                    18,
                  );
                  context.push('/notifications/:text');
                },
                child: const Text('Button'),
              )
            ],
          );
        },
      ),
    );
  }
}
