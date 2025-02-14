import 'package:isar/isar.dart';
import 'entities/reminder.dart';
import 'core.dart';

class ReminderDB {
  final _db = IsarDatabase.instance;

  // 基础 CRUD 操作
  Future<Reminder?> get(int id) => _db.get<Reminder>(id);
  Future<List<Reminder>> getAll() => _db.getAll<Reminder>();
  Future<int> save(Reminder reminder) => _db.save<Reminder>(reminder);
  Future<bool> delete(int id) => _db.delete<Reminder>(id);
  Future<int> saveAll(List<Reminder> reminders) => _db.saveAll<Reminder>(reminders);
  Future<int> deleteAll(List<int> ids) => _db.deleteAll<Reminder>(ids);
  Future<void> clear() => _db.clear<Reminder>();

  // 特定查询方法
  Future<List<Reminder>> getEnabledReminders() async {
    final isar = await _db.db;
    return await isar.reminders
        .where()
        .filter()
        .enabledEqualTo(true)
        .findAll();
  }

  Future<List<Reminder>> getRemindersByType(String type) async {
    final isar = await _db.db;
    return await isar.reminders
        .where()
        .filter()
        .typeEqualTo(type)
        .findAll();
  }

  Future<List<Reminder>> getActiveRemindersForWeekDay(int weekDay) async {
    final isar = await _db.db;
    return await isar.reminders
        .where()
        .filter()
        .enabledEqualTo(true)
        .weeksElementEqualTo(weekDay)
        .findAll();
  }

  // 获取特定时间范围内的提醒
  Future<List<Reminder>> getIntervalRemindersInTimeRange(
      DateTime startTime, DateTime endTime) async {
    final isar = await _db.db;
    return await isar.reminders
        .where()
        .filter()
        .enabledEqualTo(true)
        .startTimeIsNotNull()
        .endTimeIsNotNull()
        .startTimeLessThan(endTime)
        .endTimeGreaterThan(startTime)
        .findAll();
  }

  // 获取静态时间的提醒
  Future<List<Reminder>> getStaticTimeReminders() async {
    final isar = await _db.db;
    return await isar.reminders
        .where()
        .filter()
        .enabledEqualTo(true)
        .staticTimesIsNotEmpty()
        .findAll();
  }

  // 更新提醒状态
  Future<bool> toggleReminderStatus(int id, bool enabled) async {
    final reminder = await get(id);
    if (reminder != null) {
      reminder.enabled = enabled;
      await save(reminder);
      return true;
    }
    return false;
  }
} 