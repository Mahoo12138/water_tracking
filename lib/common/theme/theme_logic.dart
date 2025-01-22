import 'package:hive/hive.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';

import 'theme_ui_model.dart';

class ThemeLogic extends Notifier<ThemeUiModel> {
  @override
  ThemeUiModel build() {
    ThemeMode themeMode = ThemeMode.system;
    // final Box<String> prefsBox = Hive.box('prefs');
    // final String mode = prefsBox.get('themeMode',
    //     defaultValue: ThemeMode.system.toString()) as String;
    final String mode = ThemeMode.system.toString();
    switch (mode) {
      case 'ThemeMode.dark':
        themeMode = ThemeMode.dark;
        break;
      case 'ThemeMode.light':
        themeMode = ThemeMode.light;
        break;
      case 'ThemeMode.system':
        themeMode = ThemeMode.system;
        break;
    }
    return ThemeUiModel(themeMode: themeMode);
  }

  void setThemeMode(ThemeMode mode) {
    Hive.box<String>('prefs').put('themeMode', mode.toString());
    state = state.copyWith(themeMode: mode);
  }

  void toggleTheme() {
    if (state.themeMode == ThemeMode.dark) {
      setThemeMode(ThemeMode.light);
    } else {
      setThemeMode(ThemeMode.dark);
    }
  }
}

final themeLogicProvider = NotifierProvider<ThemeLogic, ThemeUiModel>(ThemeLogic.new);
