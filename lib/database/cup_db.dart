import 'package:isar/isar.dart';
import 'core.dart'; // 假设 IsarDatabase 实例在此定义
import 'entities/cup.dart';

class CupDB {
  CupDB._(); // 私有构造函数
  static final CupDB instance = CupDB._(); // 静态单例

  final _db = IsarDatabase.instance; // 获取 Isar 实例

  // 基础 CRUD 操作
  Future<Cup?> get(int id) => _db.get<Cup>(id);
  Future<List<Cup>> getAll() => _db.getAll<Cup>();
  Future<int> save(Cup cup) async {
    final isar = await _db.db;
    return await isar.writeTxn(() async => await isar.cups.put(cup));
  }

  Future<bool> delete(int id) async {
    final isar = await _db.db;
    return await isar.writeTxn(() async => await isar.cups.delete(id));
  }

  Future<int> saveAll(List<Cup> cups) async {
    final isar = await _db.db;
    return await isar.writeTxn(() async {
      final ids = await isar.cups.putAll(cups);
      return ids.length; // 返回保存的记录数量
    });
  }

  Future<int> deleteAll(List<int> ids) async {
    final isar = await _db.db;
    return await isar.writeTxn(() async => await isar.cups.deleteAll(ids));
  }

  Future<void> clear() async {
    final isar = await _db.db;
    await isar.writeTxn(() async => await isar.cups.clear());
  }

  // 特定查询方法示例
  Future<Cup?> getByName(String name) async {
    final isar = await _db.db;
    return await isar.cups.where().filter().nameEqualTo(name).findFirst();
  }

  Future<List<Cup>> searchByName(String query) async {
    final isar = await _db.db;
    return await isar.cups
        .where()
        .filter()
        .nameContains(query, caseSensitive: false)
        .findAll();
  }

  Future<List<Cup>> getByCapacityRange(int minCapacity, int maxCapacity) async {
    final isar = await _db.db;
    return await isar.cups
        .where()
        .filter()
        .capacityMLBetween(minCapacity, maxCapacity)
        .findAll();
  }
}
