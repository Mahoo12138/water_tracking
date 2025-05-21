import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'entities/entity.dart';
import 'entities/record.dart';
import 'entities/beverage.dart';
import 'entities/reminder.dart';
import 'entities/setting.dart';

class IsarDatabase {
  static IsarDatabase? _instance;
  late Future<Isar> db;

  IsarDatabase._() {
    db = openDB();
  }

  static IsarDatabase get instance {
    _instance ??= IsarDatabase._();
    return _instance!;
  }

  // 初始化默认饮品数据
  Future<void> _initDefaultBeverages() async {
    final beverageDB = await db;
    final count = await beverageDB.beverages.count();

    if (count == 0) {
      final defaultBeverages = [
        Beverage()
          ..name = "Water"
          ..color = "#2196F3"
          ..icon = "water"
          ..hydration = 1.0,
        Beverage()
          ..name = "Green Tea"
          ..color = "#4CAF50"
          ..icon = "tea"
          ..hydration = 0.85,
        Beverage()
          ..name = "Coffee"
          ..color = "#795548"
          ..icon = "coffee"
          ..hydration = 0.6,
        Beverage()
          ..name = "Milk"
          ..color = "#888888"
          ..icon = "milk"
          ..hydration = 0.95,
      ];

      await beverageDB.writeTxn(() async {
        await beverageDB.beverages.putAll(defaultBeverages);
      });
    }
  }

  // 初始化默认设置
  Future<void> _initDefaultSettings() async {
    final settingDB = await db;
    final count = await settingDB.settings.count();

    if (count == 0) {
      final defaultSettings = [
        Setting()
          ..name = "daily_water_goal"
          ..value = "2400",
        Setting()
          ..name = "notification_enabled"
          ..value = "true",
        Setting()
          ..name = "theme_mode"
          ..value = "system",
        Setting()
          ..name = "language"
          ..value = "system",
      ];

      await settingDB.writeTxn(() async {
        await settingDB.settings.putAll(defaultSettings);
      });
    }
  }

  // 初始化默认提醒
  Future<void> _initDefaultReminders() async {
    final reminderDB = await db;
    final count = await reminderDB.reminders.count();

    if (count == 0) {
      final defaultReminder = Reminder()
        ..enabled = true
        ..type = "interval"
        ..weeks = [1, 2, 3, 4, 5] // 周一到周五
        ..startTime = DateTime(2024, 1, 1, 9, 0) // 9:00
        ..endTime = DateTime(2024, 1, 1, 18, 0) // 18:00
        ..interval = 120; // 每2小时提醒一次

      await reminderDB.writeTxn(() async {
        await reminderDB.reminders.put(defaultReminder);
      });
    }
  }

  Future<void> initializeDatabase() async {
    final isar = await db;
    // 初始化默认数据
    await _initDefaultBeverages();
    await _initDefaultSettings();
    await _initDefaultReminders();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [
          RecordSchema,
          BeverageSchema,
          ReminderSchema,
          SettingSchema,
        ],
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  // 通用的 CRUD 操作
  Future<T?> get<T>(int id) async {
    final isar = await db;
    return await isar.collection<T>().get(id);
  }

  Future<List<T>> getAll<T>() async {
    final isar = await db;
    return await isar.collection<T>().where().findAll();
  }

  Future<int> save<T>(T entity) async {
    final isar = await db;
    if (entity is Entity) {
      entity.updateAt = DateTime.now();
      entity.createAt ??= DateTime.now();
    }
    return await isar.writeTxn(() async {
      return await isar.collection<T>().put(entity);
    });
  }

  Future<bool> delete<T>(int id) async {
    final isar = await db;
    return await isar.writeTxn(() async {
      return await isar.collection<T>().delete(id);
    });
  }

  Future<int> saveAll<T>(List<T> entities) async {
    final isar = await db;
    final now = DateTime.now();
    if (T is Entity) {
      for (final entity in entities) {
        if (entity is Entity) {
          entity.updateAt = now;
          entity.createAt ??= now;
        }
      }
    }
    return await isar.writeTxn(() async {
      var ids = await isar.collection<T>().putAll(entities);
      return ids.length;
    });
  }

  Future<int> deleteAll<T>(List<int> ids) async {
    final isar = await db;
    return await isar.writeTxn(() async {
      return await isar.collection<T>().deleteAll(ids);
    });
  }

  Future<void> clear<T>() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.collection<T>().clear();
    });
  }

  // 查询构建器
  Future<QueryBuilder<T, T, QWhere>> where<T>() async {
    final isar = await db;
    return isar.collection<T>().where();
  }
}
