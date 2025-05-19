import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'entity.dart'; // 假设 Entity 类在此文件中定义

part 'cup.g.dart';

@collection
class Cup extends Entity {
  String? name; // 杯子自己的名称，例如 "我的大水杯"
  int? capacityML; // 杯子的容量，单位毫升
  int? order; // 杯子的排序顺序

  // 冗余 Beverage 对象的字段
  String? beverageName;
  String? beverageColor;
  String? beverageIcon;
  double? beverageHydration;
  int? beverageOrder;
  bool? beverageIsActive;
  bool? beverageIsBuiltIn;

  @Ignore()
  Color get displayBeverageColor {
    return Color(
        int.parse(beverageColor?.replaceAll('#', '0xFF') ?? '0xFF2196F3'));
  }

  @Ignore()
  IconData get displayBeverageIcon {
    switch (beverageIcon?.toLowerCase()) {
      case 'water':
        return Icons.water_drop;
      // ... 其他 case
      default:
        return Icons.local_drink;
    }
  }
}
