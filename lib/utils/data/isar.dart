import 'package:isar/isar.dart';
import 'package:water_tracking/common/models/isar/record.dart';
// import 'package:water_tracking/common/models/isar/diary.dart';
// import 'package:water_tracking/common/models/map.dart';
import 'package:water_tracking/utils/utils.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

class IsarUtil {
  late final Isar _isar;

  Future<void> initIsar() async {
    _isar = await Isar.openAsync(
      schemas: [
        // DiarySchema,
        // CategorySchema,
      ],
      directory: Utils().fileUtil.getRealPath('database', ''),
    );
  }

  Future<void> dataMigration(String path) async {

  }

  //清空数据
  Future<void> clearIsar() async {
    await _isar.writeAsync((isar) {
      isar.clear();
    });
  }
}
