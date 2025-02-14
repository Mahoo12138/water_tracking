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
}
