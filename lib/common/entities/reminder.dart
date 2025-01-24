import 'package:isar/isar.dart';

import 'entity.dart';

part 'reminder.g.dart';

@collection
class Reminder extends Entity {
  bool? enabled;
  String? type;

  // reminder days a week
  List<int>? weeks;

  // for static mode
  List<String>? staticTimes;
  // for interval mode
  DateTime? startTime;
  DateTime? endTime;
  int? interval;
}
