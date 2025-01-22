import 'package:flutter/material.dart';

@immutable
class ThemeUiModel {
  const ThemeUiModel({
    this.isDynamic = false,
    this.themeMode = ThemeMode.system,
  });

  final ThemeMode themeMode;
  final bool isDynamic;

  ThemeUiModel copyWith({required ThemeMode themeMode}) {
    return ThemeUiModel(
      themeMode: themeMode,
    );
  }
}
