import 'package:flutter/material.dart';
import 'package:flutter_demo/local_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'home_provider.dart';
import 'my_custom_text.dart';

class Home extends StatelessWidget {
  final String text;
  const Home({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context, listen: true);
    print('HOME TWO SCREEN: ${provider.message}');
    context.read<LocalProvider>();
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        // leading: IconButton(

        // ),
        title: const Text("MY APP BAR"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              // padding: EdgeInsets.all(8),
              // margin: EdgeInsets.all(8),
              // height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 139, 113, 113),
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Column(
                  children: [
                    MyCustomText(
                      text: provider.message,
                    ),
                    const MyCustomText(
                      text: 'MY container',
                    ),
                    const MyCustomText(
                      text: 'MY container',
                    ),
                    MyCustomText(
                      text: text,
                    ),
                    const MyCustomText(
                      text: 'Anvesh',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // popUntil('/first', context);
                          // GoRouter.of(context).popUntil('/first');
                          provider.changeValue("name", 1, context);
                        },
                        child: const Text('Back')),
                    ElevatedButton(
                        onPressed: () {
                          // popUntil('/first', context);
                          // GoRouter.of(context).popUntil('/first');
                          context.pop();
                          // provider.changeValue("name", 1, context);
                        },
                        child: const Text('Back'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void popUntil(String path, BuildContext context) {
  bool shouldPop = true;
  while (shouldPop) {
    GoRouter router = GoRouter.of(context);
    final RouteMatch lastMatch =
        router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : router.routerDelegate.currentConfiguration;
    String location = matchList.uri.toString();
    print(location);
    if (location == path) {
      shouldPop = false;
    } else if (context.canPop() == false) {
      shouldPop = false;
    } else {
      context.pop();
    }
  }
}

extension GoRouterExtension on GoRouter {
  void popUntil(String path) {
    while (canPop()) {
      final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
      final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
          ? lastMatch.matches
          : routerDelegate.currentConfiguration;
      String location = matchList.uri.toString();
      if (location == path) {
        break;
      } else {
        pop();
      }
    }
  }
}
