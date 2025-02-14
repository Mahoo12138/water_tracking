import 'package:isar/isar.dart';

import 'entity.dart';

part 'beverage.g.dart';

@collection
class Beverage extends Entity {
  String? name;
  String? color;
  String? icon;
  double? hydration;
}
