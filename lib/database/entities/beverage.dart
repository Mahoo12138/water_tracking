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

  // In Beverage class
  static Color parseColor(String colorString) {
    if (colorString.isEmpty) return Colors.grey; // Default color
    final buffer = StringBuffer();
    if (colorString.length == 6 || colorString.length == 7) buffer.write('ff');
    buffer.write(colorString.replaceFirst('#', ''));
    try {
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return Colors.grey; // Default color on error
    }
  }

  static IconData getIconDataFromString(String iconName) {
    if (iconName == 'water_drop') return Icons.water_drop;
    if (iconName == 'local_cafe') return Icons.local_cafe;
    return Icons.local_drink; // Default icon
  }
}
