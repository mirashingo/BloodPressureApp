import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';
import 'route_paths.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: AppRoutePaths.appShell,
    routes: [
      GoRoute(
        name: AppRouteNames.appShell,
        path: AppRoutePaths.appShell,
        builder: (context, state) {
          return const Scaffold(
            body: Center(child: Text('Blood Pressure App')),
          );
        },
      ),
    ],
  );

  ref.onDispose(router.dispose);

  return router;
});
