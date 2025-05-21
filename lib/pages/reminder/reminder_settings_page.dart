import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_tracking/database/entities/reminder.dart';
import 'package:water_tracking/database/reminder_db.dart';
import 'package:water_tracking/pages/reminder/reminder_edit_page.dart'; // 后续创建

class ReminderSettingsPage extends StatefulWidget {
  const ReminderSettingsPage({super.key});

  @override
  State<ReminderSettingsPage> createState() => _ReminderSettingsPageState();
}

class _ReminderSettingsPageState extends State<ReminderSettingsPage> {
  bool _globalRemindersEnabled = true;
  List<Reminder> _reminderPolicies = [];
  final ReminderDB _reminderDB = ReminderDB.instance;

  static const String globalRemindersEnabledKey = 'global_reminders_enabled';

  @override
  void initState() {
    super.initState();
    _loadGlobalReminderSetting();
    _loadReminderPolicies();
  }

  Future<void> _loadGlobalReminderSetting() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _globalRemindersEnabled = prefs.getBool(globalRemindersEnabledKey) ?? true;
    });
  }

  Future<void> _saveGlobalReminderSetting(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(globalRemindersEnabledKey, value);
    setState(() {
      _globalRemindersEnabled = value;
    });
    // TODO: 根据全局开关状态，实际启用/禁用系统层面的提醒调度
  }

  Future<void> _loadReminderPolicies() async {
    final policies = await _reminderDB.getAllReminders();
    // 确保至少有一个策略，如果没有则创建一个默认的
    if (policies.isEmpty) {
        final defaultPolicy = Reminder()
        ..name = "默认间隔提醒"
        ..type = ReminderType.interval
        ..intervalMinutes = 120
        ..isSelected = true; // 默认选中第一个
        await _reminderDB.saveReminder(defaultPolicy);
        policies.add(defaultPolicy);
    } else {
        // 确保有且仅有一个被选中
        int selectedCount = policies.where((p) => p.isSelected == true).length;
        if (selectedCount == 0 && policies.isNotEmpty) {
            policies.first.isSelected = true;
            await _reminderDB.saveReminder(policies.first);
        } else if (selectedCount > 1) {
            bool firstSelected = false;
            for (var policy in policies) {
                if (policy.isSelected == true) {
                    if (!firstSelected) {
                        firstSelected = true;
                    } else {
                        policy.isSelected = false;
                        await _reminderDB.saveReminder(policy);
                    }
                }
            }
        }
    }

    setState(() {
      _reminderPolicies = policies;
    });
  }

  Future<void> _selectPolicy(Reminder policy) async {
    if (policy.isSelected == true) return; // Already selected

    for (var p in _reminderPolicies) {
      p.isSelected = (p.id == policy.id);
    }
    // 持久化所有策略的选中状态
    await _reminderDB.saveAllReminders(_reminderPolicies);
    setState(() {});
     // TODO: 通知提醒服务当前选中的策略已更改
  }

  void _navigateToEditPage([Reminder? policy]) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReminderEditPage(reminder: policy),
      ),
    );
    _loadReminderPolicies(); // 返回后刷新列表
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('提醒设置'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _navigateToEditPage(),
          ),
        ],
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('开启提醒'),
            value: _globalRemindersEnabled,
            onChanged: _saveGlobalReminderSetting,
            secondary: const Icon(Icons.notifications_active_outlined),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '提醒策略',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: _reminderPolicies.isEmpty
                ? const Center(child: Text('没有提醒策略，请添加一个。'))
                : ListView.builder(
                    itemCount: _reminderPolicies.length,
                    itemBuilder: (context, index) {
                      final policy = _reminderPolicies[index];
                      return ListTile(
                        title: Text(policy.name ?? '未命名策略'),
                        subtitle: Text(_getPolicySubtitle(policy)),
                        leading: policy.enabled == true
                            ? const Icon(Icons.alarm_on, color: Colors.green)
                            : const Icon(Icons.alarm_off, color: Colors.grey),
                        trailing: IconButton(
                          icon: Icon(
                            policy.isSelected == true
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            color: policy.isSelected == true
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                          ),
                          onPressed: () => _selectPolicy(policy),
                        ),
                        onTap: () => _navigateToEditPage(policy),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  String _getPolicySubtitle(Reminder policy) {
    switch (policy.type) {
      case ReminderType.fixed:
        return '固定时间: ${policy.fixedTimes?.where((t) => t != null).length ?? 0}个时间点';
      case ReminderType.interval:
        return '间隔提醒: 每 ${policy.intervalMinutes ?? 'N/A'} 分钟';
      case ReminderType.byIntake:
        return '根据饮水进度提醒';
      default:
        return '未知类型';
    }
  }
}