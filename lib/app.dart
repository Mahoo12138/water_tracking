import 'package:dynamic_color/dynamic_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:water_tracking/common/theme/theme_data.dart';

import 'package:water_tracking/common/theme/theme_logic.dart';
import 'package:water_tracking/router/app_routes.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeLogicProvider);
    final routerConfig = ref.watch(routerConfigProvider);

    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      final lightTheme = (currentTheme.isDynamic && lightDynamic != null)
          ? buildTheme(lightDynamic.harmonized())
          : material3LightTheme;
      final darkTheme = (currentTheme.isDynamic && darkDynamic != null)
          ? buildTheme(darkDynamic.harmonized())
          : material3DarkTheme;
      return MaterialApp.router(
        routerConfig: routerConfig,
        title: 'Flutter Boilerplate',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: currentTheme.themeMode,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      );
    });
  }
}
