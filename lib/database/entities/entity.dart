import 'package:isar/isar.dart';

class Entity {
  Id id = Isar.autoIncrement;

  DateTime? createAt;
  DateTime? updateAt;
}