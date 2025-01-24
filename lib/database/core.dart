import 'dart:async';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../common/entities/entity.dart';
import '../common/entities/record.dart';
import '../common/entities/vessel.dart';
import '../common/entities/reminder.dart';
import '../common/entities/setting.dart';

class IsarService {
  static final IsarService _instance = IsarService._internal();
  factory IsarService() => _instance;
  IsarService._internal();

  late Isar _isar;
  bool _isInitialized = false;

  /// Initialize the Isar database
  Future<void> initialize() async {
    if (_isInitialized) return;

    final dir = await getApplicationSupportDirectory();
    _isar = await Isar.open(
      [
        RecordSchema,
        VesselSchema,
        ReminderSchema,
        SettingSchema,
      ],
      directory: dir.path,
    );

    _isInitialized = true;
  }

  /// Close the Isar database
  Future<void> close() async {
    if (_isInitialized) {
      await _isar.close();
      _isInitialized = false;
    }
  }

  /// Generic method to create or update an entity
  Future<void> save<T extends Entity>(T entity) async {
    await _ensureInitialized();

    await _isar.writeTxn(() async {
      entity.updateAt = DateTime.now();
      entity.createAt ??= DateTime.now();
      await _isar.collection<T>().put(entity);
    });
  }

  /// Generic method to delete an entity
  Future<void> delete<T extends Entity>(int id) async {
    await _ensureInitialized();

    await _isar.writeTxn(() async {
      await _isar.collection<T>().delete(id);
    });
  }

  /// Generic method to get an entity by ID
  Future<T?> getById<T extends Entity>(int id) async {
    await _ensureInitialized();

    return await _isar.collection<T>().get(id);
  }

  /// Generic method to get all entities of a specific type
  Future<List<T>> getAll<T extends Entity>() async {
    await _ensureInitialized();

    return await _isar.collection<T>().where().findAll();
  }

  /// Generic method to clear all entities of a specific type
  Future<void> clear<T extends Entity>() async {
    await _ensureInitialized();

    await _isar.writeTxn(() async {
      await _isar.collection<T>().clear();
    });
  }

  /// Ensure the database is initialized before performing operations
  Future<void> _ensureInitialized() async {
    if (!_isInitialized) {
      await initialize();
    }
  }

  /// Watch a specific collection for changes
  Stream<List<T>> watchAll<T extends Entity>() {
    return _isar.collection<T>().where().watch();
  }

  /// Perform a query with custom where clauses
  Future<List<T>> query<T extends Entity>(
    QueryBuilder<T, T, QWhere> Function(QueryBuilder<T, T, QWhere>)
        queryBuilder,
  ) async {
    await _ensureInitialized();

    return queryBuilder(_isar.collection<T>().where()).findAll();
  }
}

extension EntityExtension on Entity {
  bool get isNew => id == Isar.autoIncrement;
}
