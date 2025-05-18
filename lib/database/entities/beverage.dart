import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'entity.dart';

part 'beverage.g.dart';

@collection
class Beverage extends Entity {
  String? name;
  String? color;
  String? icon;
  double? hydration;
  int? order;
  bool? isActive;
  bool? isBuiltIn;

  @Ignore()
  Color get displayColor {
    return Color(int.parse(color?.replaceAll('#', '0xFF') ?? '0xFF2196F3'));
  }

  @Ignore()
  IconData get displayIcon {
    switch (icon?.toLowerCase()) {
      case 'water':
        return Icons.water_drop;
      case 'tea':
        return Icons.emoji_food_beverage;
      case 'coffee':
        return Icons.coffee;
      case 'milk':
        return Icons.local_drink;
      default:
        return Icons.local_drink;
    }
  }
}
