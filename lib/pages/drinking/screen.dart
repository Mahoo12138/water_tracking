import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DrinkingPage extends HookWidget {
  const DrinkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 useState 来管理当前水量和目标水量
    final currentWater = useState<double>(1200); // 当前水量，单位ml
    final targetWater = useState<double>(2400); // 目标水量，单位ml

    // 计算百分比
    final percentage =
        (currentWater.value / targetWater.value * 100).clamp(0, 100);
    // 获取主题色
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 280,
                  height: 280,
                  child: // 圆环进度条
                      CircularProgressIndicator(
                    value: currentWater.value / targetWater.value,
                    strokeWidth: 12,
                    backgroundColor:
                        colorScheme.secondaryContainer, // 使用 MD3 的表面变体色
                    valueColor: AlwaysStoppedAnimation<Color>(
                        colorScheme.primary), // 使用 MD3 的主色调
                    strokeCap: StrokeCap.round,
                  ),
                ),
                // 百分比和水量显示
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
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 实现添加水量的功能
          // 这里可以弹出对话框让用户输入摄入的水量
          currentWater.value =
              (currentWater.value + 200).clamp(0, targetWater.value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
