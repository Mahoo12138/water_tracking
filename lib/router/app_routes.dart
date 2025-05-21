import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod/riverpod.dart';
import 'package:water_tracking/pages/beverage/beverage_list_page.dart';

import 'package:water_tracking/pages/home/view.dart';
import 'package:water_tracking/pages/onboarding/view.dart';
import 'package:water_tracking/pages/reminder/reminder_settings_page.dart';
import 'package:water_tracking/pages/start/view.dart';

import 'package:water_tracking/router/fade_extension.dart';
import 'package:water_tracking/database/setting_db.dart';

enum AppRoute {
  firstScreen,
  onboarding,
  home,
  login,
  register,
  forgotPassword,
  profile,
  editProfile,
  changePassword,
  beverage,
  reminder;

  String get route => '/${toString().replaceAll('AppRoute.', '')}';
  String get name => toString().replaceAll('AppRoute.', '');
}

class AppRouter extends Notifier<GoRouter> {
  @override
  GoRouter build() {
    return GoRouter(
      initialLocation: AppRoute.firstScreen.route,
      redirect: (context, state) async {
        // 检查应用是否已初始化
        final settingDB = SettingDB();
        final isInitialized = await settingDB.isAppInitialized();

        // 如果已初始化，且当前路径是首屏或引导页，则重定向到主页
        if (isInitialized &&
            (state.fullPath == AppRoute.firstScreen.route ||
                state.fullPath == AppRoute.onboarding.route)) {
          return AppRoute.home.route;
        }
        return null;
      },
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
        GoRoute(
          path: AppRoute.beverage.route,
          builder: (BuildContext context, GoRouterState state) =>
              const BeverageListPage(),
        ).fade(),
        GoRoute(
          path: AppRoute.reminder.route,
          builder: (BuildContext context, GoRouterState state) =>
              const ReminderSettingsPage(),
        ).fade(),
      ],
    );
  }
}

final routerConfigProvider =
    NotifierProvider<AppRouter, GoRouter>(AppRouter.new);
