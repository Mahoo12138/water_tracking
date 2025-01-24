import 'package:isar/isar.dart';

import 'entity.dart';

part 'record.g.dart';

@collection
class Record extends Entity {
  int? amountML;
  String? vesselName;
  String? vesselColor;
  String? vesselIcon;
  int? vesselCapacityML;
}
