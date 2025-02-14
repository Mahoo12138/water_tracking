import 'core.dart';
import 'entities/beverage.dart';
import 'package:isar/isar.dart';

class BeverageDB {
  final _db = IsarDatabase.instance;

  // 基础 CRUD 操作
  Future<Beverage?> get(int id) => _db.get<Beverage>(id);
  Future<List<Beverage>> getAll() => _db.getAll<Beverage>();
  Future<int> save(Beverage beverage) => _db.save<Beverage>(beverage);
  Future<bool> delete(int id) => _db.delete<Beverage>(id);
  Future<int> saveAll(List<Beverage> beverages) => _db.saveAll<Beverage>(beverages);
  Future<int> deleteAll(List<int> ids) => _db.deleteAll<Beverage>(ids);
  Future<void> clear() => _db.clear<Beverage>();

  // 特定查询方法
  Future<Beverage?> getByName(String name) async {
    final isar = await _db.db;
    return await isar.beverages
        .where()
        .filter()
        .nameEqualTo(name)
        .findFirst();
  }

  Future<List<Beverage>> searchByName(String query) async {
    final isar = await _db.db;
    return await isar.beverages
        .where()
        .filter()
        .nameContains(query, caseSensitive: false)
        .findAll();
  }

  Future<List<Beverage>> getByHydrationRange(
      double minHydration, double maxHydration) async {
    final isar = await _db.db;
    return await isar.beverages
        .where()
        .filter()
        .hydrationBetween(minHydration, maxHydration)
        .findAll();
  }

  // 获取所有饮品的颜色映射
  Future<Map<String, String>> getBeverageColorMap() async {
    final beverages = await getAll();
    return {
      for (var beverage in beverages)
        if (beverage.name != null && beverage.color != null)
          beverage.name!: beverage.color!
    };
  }
}