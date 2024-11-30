import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:water_tracking/pages/home/home_logic.dart';
import 'package:water_tracking/pages/home/home_view.dart';

import 'package:water_tracking/pages/start/start_logic.dart';
import 'package:water_tracking/pages/start/start_view.dart';

import 'app_pages.dart';

class AppPages {
  static final List<GetPage> routes = [
    //启动页
    GetPage(
      name: AppRoutes.startPage,
      page: () => const StartPage(),
      binds: [Bind.lazyPut(() => StartLogic())],
    ),
    //首页路由
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      binds: [
        Bind.lazyPut(() => HomeLogic()),
      ],
    ),
  ];
}