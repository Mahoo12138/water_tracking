import 'dart:async';
import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:water_tracking/app.dart';
import 'package:water_tracking/database/core.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';

import 'package:water_tracking/router/app_pages.dart';
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
  await EasyLocalization.ensureInitialized();

  registerErrorHandlers();
  //获取系统语言
  // await findSystemLocale();
  //初始化pref
  await Utils().prefUtil.initPref();

  // 初始化 Isar 数据库
  final db = IsarDatabase.instance;
  await db.openDB();  // 只打开数据库，不初始化种子数据

  platFormOption();
}

String getInitialRoute() {
  final prefs = Utils().prefUtil;
  // if (prefs.getValue<bool>('lock')!) return AppRoutes.lockPage;
  if (prefs.getValue<bool>('firstStart')!) return AppRoutes.startPage;
  return AppRoutes.startPage;
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());

    Utils().logUtil.printError('Flutter error',
        error: details.exception, stackTrace: details.stack);
    // if (details.exceptionAsString().contains('Render')) {
    //   Utils().noticeUtil.showBug(message: '布局异常！');
    // } else {
    //   Utils().noticeUtil.showBug(message: '出错了，请联系开发者！');
    // }
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  // ErrorWidget.builder = (FlutterErrorDetails details) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.red,
  //       title: Text('An error occurred'.hardcoded),
  //     ),
  //     body: Center(child: Text(details.toString())),
  //   );
  // };
}

void main() {
  runZonedGuarded(() {
    initSystem().then((_) {
      runApp(
        EasyLocalization(
            supportedLocales: [Locale('en', 'US'), Locale('zh', 'CN')],
            path: 'assets/translations',
            fallbackLocale: Locale('en', 'US'),
            assetLoader: JsonAssetLoader(),
            child: ProviderScope(
              child: App(),
            )),
      );
    });
  }, (error, stack) {});
}
