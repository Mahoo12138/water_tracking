import 'package:isar/isar.dart';
import 'entities/record.dart';
import 'core.dart';

class RecordDB {
  final _db = IsarDatabase.instance;

  // 基础 CRUD 操作
  Future<Record?> get(int id) => _db.get<Record>(id);
  Future<List<Record>> getAll() => _db.getAll<Record>();
  Future<int> save(Record record) => _db.save<Record>(record);
  Future<bool> delete(int id) => _db.delete<Record>(id);
  Future<int> saveAll(List<Record> records) => _db.saveAll<Record>(records);
  Future<int> deleteAll(List<int> ids) => _db.deleteAll<Record>(ids);
  Future<void> clear() => _db.clear<Record>();

  // 特定查询方法
  Future<List<Record>> getRecordsByDate(DateTime date) async {
    final isar = await _db.db;
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return await isar.records
        .where()
        .filter()
        .createAtBetween(startOfDay, endOfDay)
        .findAll();
  }

  Future<int> getTotalWaterIntakeByDate(DateTime date) async {
    final records = await getRecordsByDate(date);
    var amount = records.fold(0, (sum, record) => sum + (record.amountML ?? 0));
    return amount;
  }

  // 获取今天的总饮水量
  Future<int> getTodayTotalWaterIntake() async {
    final now = DateTime.now();
    return getTotalWaterIntakeByDate(now);
  }

  // 获取今天的所有记录
  Future<List<Record>> getTodayRecords() async {
    final now = DateTime.now();
    return getRecordsByDate(now);
  }

  Future<List<Record>> getRecordsByDateRange(
      DateTime startDate, DateTime endDate) async {
    final isar = await _db.db;
    return await isar.records
        .where()
        .filter()
        .createAtBetween(startDate, endDate)
        .findAll();
  }

  // 按饮品类型统计
  Future<Map<String, int>> getBeverageStatsByDate(DateTime date) async {
    final records = await getRecordsByDate(date);
    final stats = <String, int>{};
    
    for (final record in records) {
      if (record.beverageName != null) {
        stats[record.beverageName!] =
            (stats[record.beverageName!] ?? 0) + (record.amountML ?? 0);
      }
    }
    
    return stats;
  }

  // 获取某天的饮水统计信息
  Future<Map<String, dynamic>> getDailyWaterStats(DateTime date) async {
    final records = await getRecordsByDate(date);
    if (records.isEmpty) {
      return {
        'totalML': 0,
        'goalML': null,
        'records': <Record>[],
      };
    }

    final totalML = records.fold(0, (sum, record) => sum + (record.amountML ?? 0));
    // 使用当天最后一条记录的目标值作为当天的目标值
    final goalML = records.last.dailyGoalML;

    return {
      'totalML': totalML,
      'goalML': goalML,
      'records': records,
    };
  }

  // 获取今天的饮水统计信息
  Future<Map<String, dynamic>> getTodayWaterStats() async {
    final now = DateTime.now();
    return getDailyWaterStats(now);
  }
} 