import 'package:isar/isar.dart';
import 'package:water_tracking/database/entities/entity.dart';

part 'reminder_message.g.dart';

@collection
class ReminderMessage extends Entity {
  String? title;
  String? body;
  bool? isActive; // 是否可用
  bool? isDefault; // 是否为默认消息

  ReminderMessage();
}
