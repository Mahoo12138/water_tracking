import 'package:isar/isar.dart';
import 'package:water_tracking/database/entities/reminder.dart';
import 'package:water_tracking/database/entities/reminder_message.dart';
import 'core.dart';

class ReminderDB {
  ReminderDB._(); // Private constructor
  static final ReminderDB instance = ReminderDB._(); // Static instance

  final _db = IsarDatabase.instance;

  // Reminder CRUD
  Future<Reminder?> getReminder(int id) => _db.get<Reminder>(id);
  Future<List<Reminder>> getAllReminders() => _db.getAll<Reminder>();
  Future<int> saveReminder(Reminder reminder) async {
    // 如果设置此提醒为选中，则将其他提醒设置为未选中
    if (reminder.isSelected == true) {
      final all = await getAllReminders();
      for (var r in all) {
        if (r.id != reminder.id && r.isSelected == true) {
          r.isSelected = false;
          await _db.save<Reminder>(r);
        }
      }
    }
    return _db.save<Reminder>(reminder);
  }

  Future<bool> deleteReminder(int id) => _db.delete<Reminder>(id);
  Future<int> saveAllReminders(List<Reminder> reminders) =>
      _db.saveAll<Reminder>(reminders);

  Future<Reminder?> getSelectedReminder() async {
    final isar = await _db.db;
    return await isar.reminders.filter().isSelectedEqualTo(true).findFirst();
  }

  // ReminderMessage CRUD
  Future<ReminderMessage?> getReminderMessage(int id) =>
      _db.get<ReminderMessage>(id);
  Future<List<ReminderMessage>> getAllReminderMessages() =>
      _db.getAll<ReminderMessage>();
  Future<int> saveReminderMessage(ReminderMessage message) =>
      _db.save<ReminderMessage>(message);
  Future<bool> deleteReminderMessage(int id) => _db.delete<ReminderMessage>(id);
  Future<int> saveAllReminderMessages(List<ReminderMessage> messages) =>
      _db.saveAll<ReminderMessage>(messages);

  // 初始化默认提醒消息
  Future<void> initDefaultReminderMessages() async {
    final isar = await _db.db;
    final count = await isar.reminderMessages.count();
    if (count == 0) {
      final defaultMessages = [
        ReminderMessage()
          ..title = "喝水时间到！"
          ..body = "保持水分，保持健康！"
          ..isActive = true
          ..isDefault = true,
        ReminderMessage()
          ..title = "补充点能量"
          ..body = "是时候喝一杯了。"
          ..isActive = true
          ..isDefault = false,
      ];
      await saveAllReminderMessages(defaultMessages);
    }
  }
}
