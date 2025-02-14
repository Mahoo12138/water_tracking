import 'package:isar/isar.dart';

import 'entity.dart';
part 'setting.g.dart';

@collection
class Setting extends Entity {
  @Index(unique: true, replace: true)
  String? name;

  String? value;
}
