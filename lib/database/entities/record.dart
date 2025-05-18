import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'entity.dart';

part 'record.g.dart';

@collection
class Record extends Entity {
  int? amountML;
  String? beverageName;
  String? beverageColor;
  String? beverageIcon;
  double? beverageHydration;

  // 记录创建时的每日目标值
  int? dailyGoalML;

  @Ignore()
  Color get displayColor {
    return Color(int.parse(beverageColor?.replaceAll('#', '0xFF') ?? '0xFF2196F3'));
  }
}
