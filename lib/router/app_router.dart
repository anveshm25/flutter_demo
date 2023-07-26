import 'package:flutter/material.dart';
import 'package:flutter_demo/home.dart';
import 'package:flutter_demo/local_provider.dart';
import 'package:flutter_demo/my_widget.dart';
import 'package:flutter_demo/new_home.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../home_child.dart';
import '../home_two.dart';
import '../nav_screen.dart';
import '../row_column.dart';

class AppRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _homeSectionNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get router => GoRouter(
        initialLocation: '/',
        navigatorKey: _rootNavigatorKey,
        routes: [
          GoRoute(
            path: '/',
            name: '/',
            pageBuilder: (context, state) => MaterialPage(
              child: ChangeNotifierProvider<LocalProvider>(
                create: (context) => LocalProvider(),
                child: const HomeTow(),
              ),
            ),
          ),
          GoRoute(
            path: '/notifications/:text',
            name: 'notifications',
            pageBuilder: (context, state) {
              Map queryParameters = state.pathParameters;

              return MaterialPage(
                child: Home(
                  text: queryParameters['text'],
                ),
              );
            },
          ),
          StatefulShellRoute.indexedStack(
            branches: [
              StatefulShellBranch(
                navigatorKey: _homeSectionNavigatorKey,
                routes: [
                  GoRoute(
                    path: '/home',
                    routes: [
                      GoRoute(
                        path: 'homeChild',
                        name: 'homeChild',
                        pageBuilder: (context, state) =>
                            const MaterialPage(child: HomeChild()),
                      ),
                    ],
                    pageBuilder: (context, state) =>
                        const MaterialPage(child: NewHome()),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/search',
                    pageBuilder: (context, state) => const MaterialPage(
                        child: Home(
                      text: "search",
                    )),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/Settings',
                    pageBuilder: (context, state) => const MaterialPage(
                        child: Home(
                      text: "Settings",
                    )),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/profile',
                    pageBuilder: (context, state) => const MaterialPage(
                        child: Home(
                      text: "profile",
                    )),
                  ),
                ],
              ),
            ],
            pageBuilder: (context, state, navigationShell) {
              return MaterialPage(
                child: NavScreen(
                  child: navigationShell,
                ),
              );
            },
          ),
          GoRoute(
            path: '/first',
            name: 'anvesh',
            // parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) => const MaterialPage(
              child: Home(
                text: 'Through nested navigation',
              ),
            ),
          ),
        ],
      );
}
