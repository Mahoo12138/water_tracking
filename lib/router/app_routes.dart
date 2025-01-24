import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod/riverpod.dart';

import 'package:water_tracking/pages/home/view.dart';
import 'package:water_tracking/pages/onboarding/view.dart';
import 'package:water_tracking/pages/start/view.dart';

import 'package:water_tracking/router/fade_extension.dart';

enum AppRoute {
  firstScreen,
  onboarding,
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
        GoRoute(
          path: AppRoute.onboarding.route,
          builder: (BuildContext context, GoRouterState state) =>
              const OnBoardingPage(),
        ).fade(),
      ],
    );
  }
}

final routerConfigProvider =
    NotifierProvider<AppRouter, GoRouter>(AppRouter.new);
