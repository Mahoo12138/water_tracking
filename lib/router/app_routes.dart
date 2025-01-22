import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod/riverpod.dart';

import 'package:water_tracking/pages/home/home_view.dart';
import 'package:water_tracking/pages/start/start_view.dart';

import 'package:water_tracking/router/fade_extension.dart';

enum AppRoute {
  firstScreen,
  secondScreen,
  home,
  login,
  register,
  forgotPassword,
  profile,
  editProfile,
  changePassword;

  String get route => '/${toString().replaceAll('AppRoute.', '')}';
  String get name => toString().replaceAll('AppRoute.', '');
}

class AppRouter extends Notifier<GoRouter> {
  @override
  GoRouter build() {
    return GoRouter(
      initialLocation: AppRoute.firstScreen.route,
      routes: <GoRoute>[
        GoRoute(
          path: AppRoute.firstScreen.route,
          builder: (BuildContext context, GoRouterState state) =>
              const StartPage(),
        ).fade(),
        GoRoute(
          path: AppRoute.home.route,
          builder: (BuildContext context, GoRouterState state) =>
              const HomePage(),
        ).fade(),
      ],
    );
  }
}

final routerConfigProvider =
    NotifierProvider<AppRouter, GoRouter>(AppRouter.new);
