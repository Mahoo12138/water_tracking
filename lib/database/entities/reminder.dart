import 'package:isar/isar.dart';

import 'entity.dart';

part 'reminder.g.dart';

enum ReminderType {
  fixed, // 静态时间点
  interval, // 间隔
  byIntake // 根据饮水摄入量
}

@collection
class Reminder extends Entity {
  String? name; // 提醒策略名称，方便用户识别
  bool? enabled; // 此策略是否启用

  @enumerated
  ReminderType type = ReminderType.interval; // 提醒类型

  // For ReminderType.fixed
  List<DateTime>? fixedTimes; // 存储多个固定时间点
  List<bool>? fixedTimeStates; // 对应fixedTimes每个时间点的激活状态

  // For ReminderType.interval
  // startTime 和 endTime 将从全局设置读取或有默认值，这里不直接存储
  int? intervalMinutes; // 间隔分钟数

  // For ReminderType.byIntake
  // 具体的逻辑可能需要结合当前饮水记录和目标

  List<bool>? workdays; // 一周7天，true表示提醒，false不提醒 [一, 二, 三, 四, 五, 六, 日]

  bool? remindWhenGoalAchieved; // 水量100%后是否继续提醒

  int? snoozeMinutes; // 跳过提醒后，多少分钟再次提醒

  String? messageId; // 关联的提醒消息ID (指向新的ReminderMessage实体)

  bool? isSelected; // 标记此策略是否为当前选中的策略

  Reminder() {
    fixedTimes = [];
    fixedTimeStates = [];
    workdays = List.filled(7, true); // 默认周一到周日都提醒
    remindWhenGoalAchieved = false;
    snoozeMinutes = 5;
    enabled = true;
    isSelected = false;
  }
}

