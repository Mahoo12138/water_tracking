import 'package:isar/isar.dart';

import 'entity.dart';

part 'vessel.g.dart';

@collection
class Vessel extends Entity {
  int? capacityML;

  String? name;
  String? color;
  String?  icon;
}