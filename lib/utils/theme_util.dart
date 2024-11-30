import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:water_tracking/common/values/colors.dart';
import 'package:water_tracking/utils/utils.dart';

class ThemeUtil {
  Future<bool> supportDynamicColor() async {
    return (await DynamicColorPlugin.getCorePalette()) != null;
  }

  Future<Color> getDynamicColor() async {
    return Color((await DynamicColorPlugin.getCorePalette())!.primary.get(40));
  }

  ThemeData buildTheme(Brightness brightness) {
    final color = Utils().prefUtil.getValue<int>('color');
    var seedColor = switch (color) {
      0 => AppColor.themeColorList[0],
      1 => AppColor.themeColorList[1],
      2 => AppColor.themeColorList[2],
      3 => AppColor.themeColorList[3],
      4 => AppColor.themeColorList[4],
    //-1为系统配色，如果选了-1，肯定有
      _ => Color(Utils().prefUtil.getValue<int>('systemColor')!)
    };

    var themeData = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: brightness,
        dynamicSchemeVariant: color == 4 ? DynamicSchemeVariant.fidelity : DynamicSchemeVariant.tonalSpot,
      ),
      fontFamily: Platform.isWindows ? '微软雅黑' : null,
    );

    return themeData;
  }
}
