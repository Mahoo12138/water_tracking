import 'package:flutter/material.dart';
import 'package:water_tracking/database/entities/reminder.dart';
import 'package:water_tracking/database/entities/reminder_message.dart';
import 'package:water_tracking/database/reminder_db.dart';

class ReminderEditPage extends StatefulWidget {
  final Reminder? reminder;

  const ReminderEditPage({super.key, this.reminder});

  @override
  State<ReminderEditPage> createState() => _ReminderEditPageState();
}

class _ReminderEditPageState extends State<ReminderEditPage> {
  final _formKey = GlobalKey<FormState>();
  final ReminderDB _reminderDB = ReminderDB.instance;

  late Reminder _editableReminder;
  List<ReminderMessage> _availableMessages = [];
  ReminderMessage? _selectedMessage;

  // Controllers for fixed times
  List<TimeOfDay?> _fixedTimePickers = [];
  List<bool> _fixedTimeActiveStates = [];

  @override
  void initState() {
    super.initState();
    _editableReminder = widget.reminder ?? Reminder();
    if (_editableReminder.name == null || _editableReminder.name!.isEmpty) {
      _editableReminder.name = "我的提醒";
    }
    _editableReminder.workdays ??=
        List.filled(7, true); // Ensure workdays is initialized
    _editableReminder.fixedTimes ??= [];
    _editableReminder.fixedTimeStates ??= [];

    _fixedTimePickers = _editableReminder.fixedTimes!
        .map((dt) => TimeOfDay.fromDateTime(dt))
        .toList();
    _fixedTimeActiveStates =
        List<bool>.from(_editableReminder.fixedTimeStates!);

    _loadReminderMessages();
  }

  Future<void> _loadReminderMessages() async {
    final messages = await _reminderDB.getAllReminderMessages();
    setState(() {
      _availableMessages = messages.where((m) => m.isActive == true).toList();
      if (_editableReminder.messageId != null) {
        _selectedMessage = _availableMessages
            .cast<ReminderMessage?>()
            .firstWhere(
                (m) =>
                    m?.id.toString() ==
                    _editableReminder
                        .messageId, // Assuming messageId is stored as String(id)
                orElse: () => _availableMessages.isNotEmpty
                    ? _availableMessages.first
                    : null);
        if (_selectedMessage != null) {
          _editableReminder.messageId = _selectedMessage!.id.toString();
        }
      } else if (_availableMessages.isNotEmpty) {
        _selectedMessage = _availableMessages.firstWhere(
            (m) => m.isDefault == true,
            orElse: () => _availableMessages.first);
        _editableReminder.messageId = _selectedMessage?.id.toString();
      }
    });
  }

  Future<void> _saveReminder() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Convert TimeOfDay back to DateTime for fixedTimes
      _editableReminder.fixedTimes =
          _fixedTimePickers.where((time) => time != null).map((time) {
        final now = DateTime.now();
        return DateTime(now.year, now.month, now.day, time!.hour, time.minute);
      }).toList();
      _editableReminder.fixedTimeStates = List<bool>.from(
          _fixedTimeActiveStates.take(_editableReminder.fixedTimes!.length));

      await _reminderDB.saveReminder(_editableReminder);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('提醒策略已保存')),
        );
        Navigator.pop(context);
      }
    }
  }

  void _addFixedTime() {
    setState(() {
      _fixedTimePickers.add(TimeOfDay.now());
      _fixedTimeActiveStates.add(true);
    });
  }

  void _removeFixedTime(int index) {
    setState(() {
      _fixedTimePickers.removeAt(index);
      _fixedTimeActiveStates.removeAt(index);
    });
  }

  Future<void> _pickFixedTime(int index) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _fixedTimePickers[index] ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _fixedTimePickers[index]) {
      setState(() {
        _fixedTimePickers[index] = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final weekDays = ["一", "二", "三", "四", "五", "六", "日"];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reminder == null ? '新建提醒策略' : '编辑提醒策略'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveReminder,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _editableReminder.name,
                decoration: const InputDecoration(labelText: '策略名称'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入策略名称';
                  }
                  return null;
                },
                onSaved: (value) => _editableReminder.name = value,
              ),
              SwitchListTile(
                title: const Text('启用此策略'),
                value: _editableReminder.enabled ?? true,
                onChanged: (bool value) {
                  setState(() {
                    _editableReminder.enabled = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text('提醒类型', style: Theme.of(context).textTheme.titleSmall),
              DropdownButtonFormField<ReminderType>(
                value: _editableReminder.type,
                items: ReminderType.values.map((ReminderType type) {
                  String text;
                  switch (type) {
                    case ReminderType.fixed:
                      text = '固定时间';
                      break;
                    case ReminderType.interval:
                      text = '间隔提醒';
                      break;
                    case ReminderType.byIntake:
                      text = '按饮水进度';
                      break;
                  }
                  return DropdownMenuItem<ReminderType>(
                    value: type,
                    child: Text(text),
                  );
                }).toList(),
                onChanged: (ReminderType? newValue) {
                  setState(() {
                    _editableReminder.type = newValue!;
                  });
                },
                decoration: const InputDecoration(labelText: '选择类型'),
              ),
              const SizedBox(height: 16),

              // --- Type Specific Settings ---
              if (_editableReminder.type == ReminderType.fixed) ...[
                Text('固定时间点', style: Theme.of(context).textTheme.titleSmall),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _fixedTimePickers.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => _pickFixedTime(index),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: '时间点 ${index + 1}',
                                errorText: _fixedTimePickers[index] == null
                                    ? '请选择时间'
                                    : null,
                              ),
                              child: Text(
                                  _fixedTimePickers[index]?.format(context) ??
                                      '未设置'),
                            ),
                          ),
                        ),
                        Switch(
                            value: _fixedTimeActiveStates[index],
                            onChanged: (val) {
                              setState(() {
                                _fixedTimeActiveStates[index] = val;
                              });
                            }),
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline,
                              color: Colors.red),
                          onPressed: () => _removeFixedTime(index),
                        ),
                      ],
                    );
                  },
                ),
                TextButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('添加时间点'),
                  onPressed: _addFixedTime,
                ),
              ],
              if (_editableReminder.type == ReminderType.interval) ...[
                TextFormField(
                  initialValue:
                      _editableReminder.intervalMinutes?.toString() ?? '60',
                  decoration: const InputDecoration(labelText: '间隔分钟数'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null ||
                        int.parse(value) <= 0) {
                      return '请输入有效的正整数分钟';
                    }
                    return null;
                  },
                  onSaved: (value) =>
                      _editableReminder.intervalMinutes = int.parse(value!),
                ),
                // Note: Start and End time for interval are usually global or derived, not set per policy here.
              ],
              if (_editableReminder.type == ReminderType.byIntake) ...[
                const Text('根据饮水进度提醒的设置将在这里。'),
                // TODO: Add UI for intake based reminders
              ],
              const SizedBox(height: 20),

              Text('提醒消息', style: Theme.of(context).textTheme.titleSmall),
              DropdownButtonFormField<ReminderMessage>(
                value: _selectedMessage,
                items: _availableMessages.map((ReminderMessage message) {
                  return DropdownMenuItem<ReminderMessage>(
                    value: message,
                    child: Text(message.title ?? '无标题消息'),
                  );
                }).toList(),
                onChanged: (ReminderMessage? newValue) {
                  setState(() {
                    _selectedMessage = newValue;
                    _editableReminder.messageId = newValue?.id.toString();
                  });
                },
                decoration: const InputDecoration(labelText: '选择或编辑消息'),
                // TODO: Add a button to navigate to a message edit/create page
              ),
              const SizedBox(height: 20),

              Text('工作日设置', style: Theme.of(context).textTheme.titleSmall),
              Wrap(
                spacing: 8.0,
                children: List<Widget>.generate(7, (int index) {
                  return FilterChip(
                    label: Text(weekDays[index]),
                    selected: _editableReminder.workdays![index],
                    onSelected: (bool selected) {
                      setState(() {
                        _editableReminder.workdays![index] = selected;
                      });
                    },
                  );
                }),
              ),
              const SizedBox(height: 16),

              SwitchListTile(
                title: const Text('饮水目标达成后继续提醒'),
                value: _editableReminder.remindWhenGoalAchieved ?? false,
                onChanged: (bool value) {
                  setState(() {
                    _editableReminder.remindWhenGoalAchieved = value;
                  });
                },
              ),
              TextFormField(
                initialValue:
                    _editableReminder.snoozeMinutes?.toString() ?? '5',
                decoration: const InputDecoration(labelText: '稍后提醒延迟（分钟）'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      int.tryParse(value) == null ||
                      int.parse(value) < 0) {
                    return '请输入有效的分钟数';
                  }
                  return null;
                },
                onSaved: (value) =>
                    _editableReminder.snoozeMinutes = int.parse(value!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
