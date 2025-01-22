
import 'data/pref.dart';
import 'file_util.dart';
import 'theme_util.dart';
import 'log_util.dart';
import 'package_util.dart';

class Utils {
  // 1. 私有构造函数
  Utils._();

  // 2. 静态的单例实例
  static final Utils _instance = Utils._();

  // 3. 工厂构造函数返回单例
  factory Utils() => _instance;


  late final LogUtil logUtil = LogUtil();
  late final FileUtil fileUtil = FileUtil();
  late final PrefUtil prefUtil = PrefUtil();
  late final PackageUtil packageUtil = PackageUtil();
  late final ThemeUtil themeUtil = ThemeUtil();
}