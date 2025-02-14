import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:water_tracking/common/widgets/Button.dart';
import 'package:water_tracking/common/widgets/LinearGradientFadedEdges.dart';
import 'package:water_tracking/common/widgets/LowKeyButton.dart';
import 'package:water_tracking/common/widgets/PageIndicator.dart';
import 'package:water_tracking/common/widgets/SettingsContainerOutlined.dart';
import 'package:water_tracking/common/widgets/Text.dart';
import 'package:water_tracking/database/setting_db.dart';
import 'package:water_tracking/foundation/extensions/context_ext.dart';
// import 'package:budget/database/initializeDefaultDatabase.dart';

import 'package:water_tracking/foundation/extensions/datetime_ext.dart';
import 'package:water_tracking/router/app_routes.dart';
import 'package:water_tracking/utils/platform.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    this.popNavigationWhenDone = false,
    this.showPreviewDemoButton = true,
  }) : super(key: key);

  final bool popNavigationWhenDone;
  final bool showPreviewDemoButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: OnBoardingPageBody(popNavigationWhenDone: popNavigationWhenDone, showPreviewDemoButton: showPreviewDemoButton));
  }
}

class OnBoardingPageBody extends StatefulWidget {
  const OnBoardingPageBody({
    Key? key,
    this.popNavigationWhenDone = false,
    this.showPreviewDemoButton = true,
  }) : super(key: key);
  final bool popNavigationWhenDone;
  final bool showPreviewDemoButton;

  @override
  State<OnBoardingPageBody> createState() => OnBoardingPageBodyState();
}

class OnBoardingPageBodyState extends State<OnBoardingPageBody> {
  final PageController controller = PageController();
  final TextEditingController nameController = TextEditingController();
  final settingDB = SettingDB();

  double? selectedAmount;
  int selectedPeriodLength = 1;
  DateTime selectedStartDate = DateTime.now().firstDayOfMonth();
  DateTime? selectedEndDate;
  String selectedRecurrence = "Monthly";
  bool selectedIncludeIncome = false;

  bool showImage = false;
  final Image imageLanding1 = Image(
    image: AssetImage("assets/landing/Graph.png"),
  );
  final Image imageLanding2 = Image(
    image: AssetImage("assets/landing/BankOrPig.png"),
  );
  final Image imageLanding3 = Image(
    image: AssetImage("assets/landing/PigBank.png"),
  );

  // 添加性别选择状态
  String? selectedGender;

  // 添加体重相关状态
  String weightUnit = 'kg';  // 默认单位为kg
  double weight = 60.0;      // 默认体重为60kg

  // 添加活动等级状态
  int? selectedActivityLevel;

  // 添加气候选择状态
  int? selectedClimate;

  // 添加目标水量相关状态
  String waterUnit = 'ml';
  double calculatedGoal = 0.0;
  bool isEditingGoal = false;
  final TextEditingController goalController = TextEditingController();

  @override
  void didChangeDependencies() {
    precacheImage(imageLanding1.image, context);
    precacheImage(imageLanding2.image, context);
    precacheImage(imageLanding3.image, context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _focusAttachment = _focusNode.attach(context, onKeyEvent: (node, event) {
      if (event.logicalKey.keyLabel == "Go Back" || event.logicalKey == LogicalKeyboardKey.escape) {
        if (widget.popNavigationWhenDone) nextNavigation();
      } else if (event.runtimeType == KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowRight) {
        nextOnBoardPage();
      } else if (event.runtimeType == KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        previousOnBoardPage();
      }
      return KeyEventResult.handled;
    });
    _focusNode.requestFocus();

    Future.delayed(Duration.zero, () async {
      // Functions to run after entire UI loaded - landing page
      // Run here too, so user has a wallet when creating first budget
      // We need to run this after the UI is loaded - after translations are loaded
      // await initializeDefaultDatabase();
    });

    // 初始化计算目标水量
    calculatedGoal = calculateDailyWaterGoal();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void nextOnBoardPage() async {
    // 如果是第一页（昵称输入页），保存昵称
    if ((controller.page?.round().toInt() ?? 0) == 0) {
      final name = nameController.text.trim();
      if (name.isEmpty) {
        // 显示错误提示
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter your name'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      // 保存昵称到数据库
      await settingDB.setValue('name', name);
    }
    // 如果是第二页（性别选择页），保存性别
    else if ((controller.page?.round().toInt() ?? 0) == 1) {
      if (selectedGender == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select your gender'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      await settingDB.setValue('gender', selectedGender!.toUpperCase());
    }
    // 如果是第三页（体重选择页），保存体重和单位
    else if ((controller.page?.round().toInt() ?? 0) == 2) {
      await settingDB.setValue('weightUnit', weightUnit);
      await settingDB.setValue('weight', weight.toString());
    }
    // 如果是第四页（活动等级页），保存活动等级
    else if ((controller.page?.round().toInt() ?? 0) == 3) {
      if (selectedActivityLevel == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select your activity level'), behavior: SnackBarBehavior.floating),
        );
        return;
      }
      await settingDB.setValue('activityLevel', selectedActivityLevel.toString());
    }
    // 如果是第五页（气候选择页），保存气候等级
    else if ((controller.page?.round().toInt() ?? 0) == 4) {
      if (selectedClimate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select your climate'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      await settingDB.setValue('climateLevel', selectedClimate.toString());
    }

    if ((controller.page?.round().toInt() ?? 0) + 1 == numPages) {
      nextNavigation();
    } else {
      controller.nextPage(
        duration: Duration(milliseconds: 1100),
        curve: ElasticOutCurve(1.3),
      );
    }
  }

  void previousOnBoardPage() {
    controller.previousPage(
      duration: Duration(milliseconds: 1100),
      curve: ElasticOutCurve(1.3),
    );
  }

  int numPages = 6;

  // 性别选择项数据
  final List<Map<String, dynamic>> genderOptions = [
    {
      'value': 'male',
      'label': 'Male',
      'icon': Icons.male,
    },
    {
      'value': 'female',
      'label': 'Female',
      'icon': Icons.female,
    },
    {
      'value': 'pregnant',
      'label': 'Pregnant',
      'icon': Icons.pregnant_woman,
    },
    {
      'value': 'breastfeeding',
      'label': 'Breastfeeding',
      'icon': Icons.child_friendly,
    },
    {
      'value': 'other',
      'label': 'Other',
      'icon': Icons.person_outline,
    },
  ];

  // 活动等级选项数据
  final List<Map<String, dynamic>> activityOptions = [
    {
      'value': 0,
      'label': 'Sedentary',
      'description': 'Less than 30 minutes a day of intentional exercise.',
      'icon': Icons.weekend_outlined,
    },
    {
      'value': 1,
      'label': 'Light Activity',
      'description': 'You do intentional exercise every day for at least 30 minutes.',
      'icon': Icons.directions_walk_outlined,
    },
    {
      'value': 2,
      'label': 'Moderately Active',
      'description': 'Exercise every day that is equivalent to walking for at least one hour and 45 minutes.',
      'icon': Icons.directions_run_outlined,
    },
    {
      'value': 3,
      'label': 'Very Active',
      'description': 'Exercise every day that is equivalent to briskly walking for at least four hours.',
      'icon': Icons.sports_outlined,
    },
  ];

  // 气候选项数据
  final List<Map<String, dynamic>> climateOptions = [
    {
      'value': 0,
      'label': 'Hot',
      'description': 'High temperatures increase sweating and water loss',
      'icon': Icons.wb_sunny_outlined,
    },
    {
      'value': 1,
      'label': 'Temperate',
      'description': 'Moderate temperatures with balanced water needs',
      'icon': Icons.cloud_outlined,
    },
    {
      'value': 2,
      'label': 'Cold',
      'description': 'Cold air requires more water for breathing',
      'icon': Icons.ac_unit_outlined,
    },
  ];

  // 转换显示的体重值
  String getDisplayWeight() {
    return weight.toStringAsFixed(1);
  }

  // 单位转换
  void toggleWeightUnit() {
    setState(() {
      if (weightUnit == 'kg') {
        weightUnit = 'lbs';
        weight = weight * 2.20462; // 转换为磅
      } else {
        weightUnit = 'kg';
        weight = weight / 2.20462; // 转换为千克
      }
    });
  }

  // 计算每日目标水量的简单函数
  double calculateDailyWaterGoal() {
    // 基础水量：按体重计算（每公斤30-35ml）
    double baseWater = weight * (weightUnit == 'kg' ? 33 : 15); // kg: 33ml/kg, lbs: 15ml/lb

    // 活动等级调整
    double activityMultiplier = 1.0;
    switch (selectedActivityLevel) {
      case 0: // Sedentary
        activityMultiplier = 1.0;
        break;
      case 1: // Light Activity
        activityMultiplier = 1.1;
        break;
      case 2: // Moderately Active
        activityMultiplier = 1.2;
        break;
      case 3: // Very Active
        activityMultiplier = 1.4;
        break;
    }

    // 气候调整
    double climateMultiplier = 1.0;
    switch (selectedClimate) {
      case 0: // Hot
        climateMultiplier = 1.2;
        break;
      case 1: // Temperate
        climateMultiplier = 1.0;
        break;
      case 2: // Cold
        climateMultiplier = 1.1;
        break;
    }

    // 性别调整
    double genderMultiplier = 1.0;
    switch (selectedGender) {
      case 'male':
        genderMultiplier = 1.0;
        break;
      case 'female':
        genderMultiplier = 0.9;
        break;
      case 'pregnant':
        genderMultiplier = 1.3;
        break;
      case 'breastfeeding':
        genderMultiplier = 1.4;
        break;
      default:
        genderMultiplier = 1.0;
    }

    double finalGoal = baseWater * activityMultiplier * climateMultiplier * genderMultiplier;
    return finalGoal.roundToDouble();
  }

  void toggleWaterUnit() {
    setState(() {
      if (waterUnit == 'ml') {
        waterUnit = 'oz';
        calculatedGoal = calculatedGoal / 29.5735; // Convert ml to oz
      } else {
        waterUnit = 'ml';
        calculatedGoal = calculatedGoal * 29.5735; // Convert oz to ml
      }
      goalController.text = calculatedGoal.round().toString();
    });
  }

  void showGoalEditDialog() {
    goalController.text = calculatedGoal.round().toString();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),
                  Text(
                    'Edit Daily Goal',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        calculatedGoal = double.tryParse(goalController.text) ?? calculatedGoal;
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Confirm'),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // 单位选择
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChoiceChip(
                        label: Text('ml'),
                        selected: waterUnit == 'ml',
                        onSelected: (_) {
                          if (waterUnit != 'ml') {
                            setState(() {
                              toggleWaterUnit();
                            });
                          }
                        },
                        selectedColor: Theme.of(context).colorScheme.primaryContainer,
                        labelStyle: TextStyle(
                          color: waterUnit == 'ml'
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(width: 16),
                      ChoiceChip(
                        label: Text('oz'),
                        selected: waterUnit == 'oz',
                        onSelected: (_) {
                          if (waterUnit != 'oz') {
                            setState(() {
                              toggleWaterUnit();
                            });
                          }
                        },
                        selectedColor: Theme.of(context).colorScheme.primaryContainer,
                        labelStyle: TextStyle(
                          color: waterUnit == 'oz'
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // 数值输入
                  TextField(
                    controller: goalController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                    decoration: InputDecoration(
                      suffix: Text(waterUnit),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    autofocus: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void nextNavigation({bool generatePreview = false}) async {
    // 保存最终的目标水量
    await settingDB.setValue('waterUnit', waterUnit);
    await settingDB.setValue('dailyGoal', calculatedGoal.round().toString());
    
    // 导航到主页
    if (mounted) {
      context.go('/home');
    }
  }

  FocusNode _focusNode = FocusNode();
  late FocusAttachment _focusAttachment;

  @override
  Widget build(BuildContext context) {
    _focusAttachment.reparent();

    final List<Widget> children = [
      OnBoardPage(
        widgets: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Text(
            'What is your name?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Only used in your profile and notifications',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
              textCapitalization: TextCapitalization.words,
              onSubmitted: (_) => nextOnBoardPage(),
            ),
          ),
        ],
      ),
      OnBoardPage(
        widgets: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Text(
            'Choose your gender',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Based on the body type we will better calculate your hydration needs',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          ...genderOptions.map((option) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: selectedGender == option['value']
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline.withOpacity(0.3),
                ),
              ),
              child: RadioListTile<String>(
                value: option['value'],
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
                title: Text(
                  option['label'],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                secondary: Icon(
                  option['icon'],
                  color: selectedGender == option['value']
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                activeColor: Theme.of(context).colorScheme.primary,
                selected: selectedGender == option['value'],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          )).toList(),
        ],
      ),
      OnBoardPage(
        widgets: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Text(
            'What is your weight?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Weight has a big impact on calculating your daily water goal',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),
          // 单位选择
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: Text('kg'),
                selected: weightUnit == 'kg',
                onSelected: (_) {
                  if (weightUnit != 'kg') toggleWeightUnit();
                },
                selectedColor: Theme.of(context).colorScheme.primaryContainer,
                labelStyle: TextStyle(
                  color: weightUnit == 'kg'
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(width: 16),
              ChoiceChip(
                label: Text('lbs'),
                selected: weightUnit == 'lbs',
                onSelected: (_) {
                  if (weightUnit != 'lbs') toggleWeightUnit();
                },
                selectedColor: Theme.of(context).colorScheme.primaryContainer,
                labelStyle: TextStyle(
                  color: weightUnit == 'lbs'
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 32),
          // 体重显示
          Text(
            '${getDisplayWeight()} $weightUnit',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          // 滑动选择器
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Theme.of(context).colorScheme.primary,
                inactiveTrackColor: Theme.of(context).colorScheme.primaryContainer,
                thumbColor: Theme.of(context).colorScheme.primary,
                overlayColor: Theme.of(context).colorScheme.primary.withOpacity(0.12),
                trackHeight: 8.0,
              ),
              child: Slider(
                value: weight,
                min: weightUnit == 'kg' ? 30.0 : 66.0,  // 最小30kg或66磅
                max: weightUnit == 'kg' ? 200.0 : 440.0, // 最大200kg或440磅
                onChanged: (value) {
                  setState(() {
                    weight = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      OnBoardPage(
        widgets: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Text(
            'Activity Level',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'When burning calories, your body needs more fluids to stay hydrated.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          ...activityOptions.map((option) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: selectedActivityLevel == option['value']
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline.withOpacity(0.3),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<int>(
                    value: option['value'],
                    groupValue: selectedActivityLevel,
                    onChanged: (value) {
                      setState(() {
                        selectedActivityLevel = value;
                      });
                    },
                    title: Text(
                      option['label'],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    secondary: Icon(
                      option['icon'],
                      color: selectedActivityLevel == option['value']
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    selected: selectedActivityLevel == option['value'],
                  ),
                  if (selectedActivityLevel == option['value'])
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Text(
                        option['description'],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )).toList(),
        ],
      ),
      OnBoardPage(
        widgets: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Text(
            'Choose your climate',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Sweating increases water loss. Breathing in cold, dry air requires more water to warm and moist it before reaching the lungs.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32),
          ...climateOptions.map((option) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: selectedClimate == option['value']
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline.withOpacity(0.3),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<int>(
                    value: option['value'],
                    groupValue: selectedClimate,
                    onChanged: (value) {
                      setState(() {
                        selectedClimate = value;
                      });
                    },
                    title: Text(
                      option['label'],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    secondary: Icon(
                      option['icon'],
                      color: selectedClimate == option['value']
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    selected: selectedClimate == option['value'],
                  ),
                  if (selectedClimate == option['value'])
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Text(
                        option['description'],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )).toList(),
        ],
      ),
      OnBoardPage(
        widgets: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Icon(
            Icons.check_circle_outline_rounded,
            size: 120,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: 32),
          Text(
            'Your Daily Goal',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'You can tap the value and setup your own manual daily goal.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32),
          if (!isEditingGoal)
            GestureDetector(
              onTap: showGoalEditDialog,
              child: Text(
                '${calculatedGoal.round()} $waterUnit',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          else
            Column(
              children: [
                Text(
                  '${calculatedGoal.round()} $waterUnit',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
        ],
      ),
    ];

    if (numPages != children.length) print("Error: onboarding pages mismatch in length!");

    return Stack(
      children: [
        PageView(
          controller: controller,
          children: children,
        ),
        PositionedDirectional(
          bottom: 0,
          child: IgnorePointer(
            child: Container(
              height: 100,
              width: 1000,
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.background.withOpacity(0.0),
                    Theme.of(context).colorScheme.background,
                  ],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  stops: [0.1, 1],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Padding(
            padding: EdgeInsetsDirectional.only(bottom: MediaQuery.viewPaddingOf(context).bottom),
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 18,
                vertical: 15,
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget? child) {
                        int currentIndex = controller.page?.round().toInt() ?? 0;
                        return AnimatedOpacity(
                          opacity: currentIndex <= 0 ? 0 : 1,
                          duration: Duration(milliseconds: 200),
                          child: ButtonIcon(
                            onTap: () {
                              previousOnBoardPage();
                            },
                            icon: Icons.arrow_back_rounded,
                            size: 50,
                            padding: EdgeInsetsDirectional.all(6),
                          ),
                        );
                      },
                    ),
                    PageIndicator(controller: controller, itemCount: children.length),
                    AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget? child) {
                        int currentIndex = controller.page?.round().toInt() ?? 0;
                        bool isLastPage = currentIndex >= children.length - 1;
                        return AnimatedOpacity(
                          opacity: 1,
                          duration: Duration(milliseconds: 200),
                          child: ButtonIcon(
                            onTap: () => nextOnBoardPage(),
                            icon: isLastPage ? Icons.check_rounded : Icons.arrow_forward_rounded,
                            size: 50,
                            padding: EdgeInsetsDirectional.all(6),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({Key? key, required this.widgets, this.bottomWidget}) : super(key: key);
  final List<Widget> widgets;
  final Widget? bottomWidget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: LinearGradientFadedEdges(
            gradientSize: 20,
            enableTop: isIOS(),
            enableBottom: isIOS(),
            enableStart: false,
            enableEnd: false,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(height: 20),
                    ...widgets,
                    SizedBox(height: 80),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(bottom: 60 + MediaQuery.paddingOf(context).bottom),
          child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: bottomWidget ?? SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
