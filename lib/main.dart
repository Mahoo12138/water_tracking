import 'dart:async';
import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:intl/find_locale.dart';

import 'package:water_tracking/router/app_pages.dart';
import 'package:water_tracking/router/app_routes.dart';
import 'package:water_tracking/utils/utils.dart';

void platFormOption() {
  if (Platform.isAndroid) {
    //设置高刷
    unawaited(FlutterDisplayMode.setHighRefreshRate());
  }
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    doWhenWindowReady(() {
      appWindow.minSize = const Size(512, 640);
      appWindow.size = const Size(1024, 640);
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
}

Future<void> initSystem() async {
  WidgetsFlutterBinding.ensureInitialized();
  //获取系统语言
  await findSystemLocale();
  //初始化pref
  await Utils().prefUtil.initPref();
  //初始化Isar
  await Utils().isarUtil.initIsar();

  // await RustLib.init();
  platFormOption();
}


String getInitialRoute() {
  final prefs = Utils().prefUtil;
  // if (prefs.getValue<bool>('lock')!) return AppRoutes.lockPage;
  if (prefs.getValue<bool>('firstStart')!) return AppRoutes.startPage;
  return AppRoutes.startPage;
}


void main() {
  runZonedGuarded((){
    FlutterError.onError = (details) {
      Utils().logUtil.printError('Flutter error', error: details.exception, stackTrace: details.stack);
      if (details.exceptionAsString().contains('Render')) {
        Utils().noticeUtil.showBug(message: '布局异常！');
      } else {
        Utils().noticeUtil.showBug(message: '出错了，请联系开发者！');
      }
    };
    initSystem().then((_) {
      return runApp(GetMaterialApp(
        initialRoute: getInitialRoute(),
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
        builder: (context, child) {
          final fontScale = Utils().prefUtil.getValue<double>('fontScale')!;
          final colorScheme = Theme.of(context).colorScheme;
          final mediaQuery = MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(fontScale),
            ),
            child: FToastBuilder()(context, child!),
          );
          // 根据平台决定是否需要 MoveWindow
          final windowChild = (Platform.isWindows || Platform.isMacOS || Platform.isWindows)
              ? Column(
            children: [
              // WindowButtons(
              //   colorScheme: colorScheme,
              // ),
              Expanded(child: mediaQuery),
            ],
          )
              : mediaQuery;
          return windowChild;
        },
        theme: Utils().themeUtil.buildTheme(Brightness.light),
        darkTheme: Utils().themeUtil.buildTheme(Brightness.dark),
        themeMode: ThemeMode.values[Utils().prefUtil.getValue<int>('themeMode')!],
        defaultTransition: Transition.cupertino,
        getPages: AppPages.routes,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ));
    });

  }, (error, stack){

  });
}