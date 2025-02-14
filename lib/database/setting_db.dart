import 'package:isar/isar.dart';
import 'entities/setting.dart';
import 'core.dart';

class SettingDB {
  final _db = IsarDatabase.instance;

  // 基础 CRUD 操作
  Future<Setting?> get(int id) => _db.get<Setting>(id);
  Future<List<Setting>> getAll() => _db.getAll<Setting>();
  Future<int> save(Setting setting) => _db.save<Setting>(setting);
  Future<bool> delete(int id) => _db.delete<Setting>(id);
  Future<int> saveAll(List<Setting> settings) => _db.saveAll<Setting>(settings);
  Future<int> deleteAll(List<int> ids) => _db.deleteAll<Setting>(ids);
  Future<void> clear() => _db.clear<Setting>();

  // 特定查询方法
  Future<Setting?> getByName(String name) async {
    final isar = await _db.db;
    return await isar.settings.where().nameEqualTo(name).findFirst();
  }

  Future<String?> getValue(String name) async {
    final setting = await getByName(name);
    return setting?.value;
  }

  Future<bool> setValue(String name, String value) async {
    final isar = await _db.db;
    final setting = await getByName(name) ?? Setting()..name = name;
    setting.value = value;
    await save(setting);
    return true;
  }

  // 批量获取设置
  Future<Map<String, String>> getMultipleSettings(List<String> names) async {
    final isar = await _db.db;
    final settings = await isar.settings.where().anyOf(names, (q, name) => q.nameEqualTo(name)).findAll();
    return {
      for (var setting in settings)
        if (setting.name != null && setting.value != null)
          setting.name!: setting.value!
    };
  }

  // 批量设置值
  Future<bool> setMultipleValues(Map<String, String> settings) async {
    final entities = settings.entries.map((e) => Setting()
      ..name = e.key
      ..value = e.value).toList();
    
    await saveAll(entities);
    return true;
  }

  // 删除设置
  Future<bool> deleteByName(String name) async {
    final setting = await getByName(name);
    if (setting != null) {
      return await delete(setting.id);
    }
    return false;
  }
} 