import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:water_tracking/database/record_db.dart';
import 'package:water_tracking/database/setting_db.dart';
import 'package:water_tracking/database/beverage_db.dart';
import 'package:water_tracking/database/entities/record.dart';
import 'package:water_tracking/database/entities/beverage.dart';
import 'dart:math';

// 添加饮水记录的底部弹出sheet
class AddWaterBottomSheet extends HookWidget {
  final Function(Record record) onAdd;
  final double initialDailyGoal;

  const AddWaterBottomSheet({
    super.key,
    required this.onAdd,
    required this.initialDailyGoal,
  });

  @override
  Widget build(BuildContext context) {
    final selectedBeverage = useState<Beverage?>(null);
    final selectedDate = useState<DateTime>(DateTime.now());
    final selectedTime = useState<TimeOfDay>(TimeOfDay.now());
    final customAmount = useState<int>(250);
    final beverages = useState<List<Beverage>>([]);
    final beverageDB = BeverageDB.instance;

    // 加载饮品列表
    useEffect(() {
      beverageDB.getAll().then((list) {
        beverages.value = list;
        // 默认选择Water
        selectedBeverage.value = list.firstWhere(
          (b) => b.name?.toLowerCase() == 'water',
          orElse: () => list.first,
        );
      });
      return null;
    }, []);

    // 预设的饮水量选项
    final presetAmounts = [150, 200, 250, 300];

    // 添加记录的方法
    void addRecord(int amount) {
      if (selectedBeverage.value == null) return;
      final record = Record()
        ..amountML = amount
        ..beverageName = selectedBeverage.value!.name
        ..beverageColor = selectedBeverage.value!.color
        ..beverageIcon = selectedBeverage.value!.icon
        ..beverageHydration = selectedBeverage.value!.hydration
        ..dailyGoalML = initialDailyGoal.toInt()
        ..createAt = DateTime(
          selectedDate.value.year,
          selectedDate.value.month,
          selectedDate.value.day,
          selectedTime.value.hour,
          selectedTime.value.minute,
        );

      onAdd(record);
      Navigator.pop(context);
    }

    // 选择日期
    void selectDate() async {
      final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime.now().subtract(const Duration(days: 30)),
        lastDate: DateTime.now(),
      );
      if (picked != null) {
        selectedDate.value = picked;
      }
    }

    // 选择时间
    void selectTime() async {
      final picked = await showTimePicker(
        context: context,
        initialTime: selectedTime.value,
      );
      if (picked != null) {
        selectedTime.value = picked;
      }
    }

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 饮品列表
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: beverages.value.length + 2, // +2 for Add and Edit buttons
              itemBuilder: (context, index) {
                if (index < beverages.value.length) {
                  final beverage = beverages.value[index];
                  final isSelected = selectedBeverage.value?.id == beverage.id;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Material(
                        color: isSelected 
                          ? beverage.displayColor
                          : Theme.of(context).colorScheme.surfaceVariant,
                        child: InkWell(
                          onTap: () => selectedBeverage.value = beverage,
                          child: Container(
                            width: 80,
                            height: 84,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  beverage.displayIcon,
                                  color: isSelected 
                                    ? Colors.white
                                    : beverage.displayColor,
                                  size: 32,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  beverage.name ?? '',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: isSelected 
                                      ? Colors.white
                                      : Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  // Add and Edit buttons
                  final isAdd = index == beverages.value.length;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Material(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        child: InkWell(
                          onTap: () {
                            // TODO: 处理添加和编辑操作
                          },
                          child: Container(
                            width: 80,
                            height: 84,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  isAdd ? Icons.add : Icons.edit,
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  size: 32,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  isAdd ? 'Add' : 'Edit',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 24),
          // 预设饮水量按钮
          Wrap(
            spacing: 8,
            children: presetAmounts.map((amount) => ElevatedButton(
              onPressed: () => addRecord(amount),
              child: Text('$amount ml'),
            )).toList(),
          ),
          const SizedBox(height: 24),
          // 自定义饮水量选择器
          Column(
            children: [
              Container(
                height: 150,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Theme.of(context).colorScheme.outline.withOpacity(0.2)),
                    bottom: BorderSide(color: Theme.of(context).colorScheme.outline.withOpacity(0.2)),
                  ),
                ),
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  perspective: 0.005,
                  diameterRatio: 2.0,
                  physics: const FixedExtentScrollPhysics(),
                  controller: FixedExtentScrollController(initialItem: 24), // 默认选中250ml
                  onSelectedItemChanged: (index) {
                    customAmount.value = (index + 1) * 10;
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 100,
                    builder: (context, index) {
                      final amount = (index + 1) * 10;
                      final isSelected = customAmount.value == amount;
                      return Center(
                        child: Text(
                          '$amount ml',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: isSelected 
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              IconButton(
                onPressed: () => addRecord(customAmount.value),
                icon: const Icon(Icons.check_circle_outline),
                iconSize: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 日期和时间选择
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: selectDate,
                icon: Icon(Icons.calendar_today),
                label: Text(
                  '${selectedDate.value.year}-${selectedDate.value.month}-${selectedDate.value.day}',
                ),
              ),
              TextButton.icon(
                onPressed: selectTime,
                icon: Icon(Icons.access_time),
                label: Text(
                  selectedTime.value.format(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getBeverageIcon(String identifier) {
    switch (identifier.toLowerCase()) {
      case 'water':
        return Icons.water_drop;
      case 'tea':
        return Icons.emoji_food_beverage;
      case 'coffee':
        return Icons.coffee;
      case 'milk':
        return Icons.local_drink;
      default:
        return Icons.local_drink;
    }
  }
}

// 添加自定义进度条画笔
class SegmentedCircularProgress extends CustomPainter {
  final List<Record> records;
  final double totalAmount;
  final double targetAmount;
  final Color backgroundColor;

  SegmentedCircularProgress({
    required this.records,
    required this.totalAmount,
    required this.targetAmount,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const startAngle = -90 * (pi / 180); // 从12点钟方向开始

    // 绘制背景
    final bgPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2 * pi,
      false,
      bgPaint,
    );

    // 如果没有记录或总量为0，直接返回
    if (records.isEmpty || totalAmount == 0) return;

    // 计算每个记录的起始角度和扫描角度
    double currentAngle = startAngle;
    for (final record in records) {
      final amount = record.amountML?.toDouble() ?? 0;
      if (amount == 0) continue;

      final sweepAngle = (amount / targetAmount) * (2 * pi);
      final color = Color(int.parse(record.beverageColor?.replaceAll('#', '0xFF') ?? '0xFF2196F3'));

      final paint = Paint()
        ..color = color
        ..strokeWidth = 12
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        currentAngle,
        sweepAngle,
        false,
        paint,
      );

      currentAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrinkingPage extends HookWidget {
  const DrinkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWater = useState<double>(0);
    final targetWater = useState<double>(2400);
    final records = useState<List<Record>>([]);
    final recordDB = RecordDB();
    final settingDB = SettingDB();

    // 初始化数据
    useEffect(() {
      // 获取目标水量
      settingDB.getValue('dailyGoal').then((value) {
        if (value != null) {
          targetWater.value = double.parse(value);
        }
      });

      // 获取今天的饮水统计和记录
      recordDB.getTodayWaterStats().then((stats) {
        currentWater.value = stats['totalML'].toDouble();
        if (stats['goalML'] != null) {
          targetWater.value = stats['goalML'].toDouble();
        }
        records.value = (stats['records'] as List<Record>? ?? [])
          ..sort((a, b) => b.createAt!.compareTo(a.createAt!));
      });

      return null;
    }, []);

    // 计算百分比
    final percentage = (currentWater.value / targetWater.value * 100).clamp(0, 100);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Water Reminder',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: 处理提醒设置
            },
            icon: Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          // 进度指示器部分
          Container(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 280,
                    height: 280,
                    child: CustomPaint(
                      painter: SegmentedCircularProgress(
                        records: records.value,
                        totalAmount: currentWater.value,
                        targetAmount: targetWater.value,
                        backgroundColor: colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${percentage.toInt()}%',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${currentWater.value.toInt()}/${targetWater.value.toInt()}ml',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // 记录列表
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: records.value.length,
              itemBuilder: (context, index) {
                final record = records.value[index];
                final beverageColor = Color(
                  int.parse(record.beverageColor?.replaceAll('#', '0xFF') ?? '0xFF2196F3')
                );
                final time = record.createAt != null
                    ? '${record.createAt!.hour.toString().padLeft(2, '0')}:${record.createAt!.minute.toString().padLeft(2, '0')}'
                    : '--:--';
                final hydrationAmount = ((record.amountML ?? 0) * (record.beverageHydration ?? 1.0)).toInt();

                return Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          // 饮品图标
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: beverageColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              _getBeverageIcon(record.beverageIcon ?? 'water'),
                              color: beverageColor,
                            ),
                          ),
                          SizedBox(width: 16),
                          // 饮品信息
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      record.beverageName ?? 'Water',
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '${record.amountML ?? 0}ml',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Hydration: $hydrationAmount ml',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // 时间
                          Text(
                            time,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onDoubleTap: () async {
          // 获取最近一次记录
          final lastRecord = records.value.isNotEmpty ? records.value.first : null;
          if (lastRecord != null) {
            // 创建新记录，复制最近一次记录的饮品信息
            final newRecord = Record()
              ..amountML = lastRecord.amountML
              ..beverageName = lastRecord.beverageName
              ..beverageColor = lastRecord.beverageColor
              ..beverageIcon = lastRecord.beverageIcon
              ..beverageHydration = lastRecord.beverageHydration
              ..dailyGoalML = targetWater.value.toInt()
              ..createAt = DateTime.now();

            // 保存记录并更新状态
            await recordDB.save(newRecord);
            final stats = await recordDB.getTodayWaterStats();
            currentWater.value = stats['totalML'].toDouble();
            records.value = (stats['records'] as List<Record>? ?? [])
              ..sort((a, b) => b.createAt!.compareTo(a.createAt!));

            // 显示提示
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added ${lastRecord.amountML}ml of ${lastRecord.beverageName}'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          }
        },
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => AddWaterBottomSheet(
                initialDailyGoal: targetWater.value,
                onAdd: (record) async {
                  await recordDB.save(record);
                  final stats = await recordDB.getTodayWaterStats();
                  currentWater.value = stats['totalML'].toDouble();
                  records.value = (stats['records'] as List<Record>? ?? [])
                    ..sort((a, b) => b.createAt!.compareTo(a.createAt!));
                },
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  IconData _getBeverageIcon(String identifier) {
    switch (identifier.toLowerCase()) {
      case 'water':
        return Icons.water_drop;
      case 'tea':
        return Icons.emoji_food_beverage;
      case 'coffee':
        return Icons.coffee;
      case 'milk':
        return Icons.local_drink;
      default:
        return Icons.local_drink;
    }
  }
}
