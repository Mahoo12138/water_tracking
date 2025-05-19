import 'package:flutter/material.dart';
import 'package:water_tracking/database/cup_db.dart';
import 'package:water_tracking/database/entities/cup.dart';
import 'package:water_tracking/database/beverage_db.dart';
import 'package:water_tracking/database/entities/beverage.dart';

class CupDetailPage extends StatefulWidget {
  final Cup? cup;

  const CupDetailPage({super.key, this.cup});

  @override
  State<CupDetailPage> createState() => _CupDetailPageState();
}

class _CupDetailPageState extends State<CupDetailPage> {
  final _formKey = GlobalKey<FormState>();
  late String _cupName;
  late int _capacityML;
  Beverage? _selectedBeverage;

  // State for beverage details, editable directly or set by selection
  late String _beverageNameForCup;
  late String _beverageColorForCup;
  late String _beverageIconForCup;
  late double _beverageHydrationForCup;
  // these are not directly editable by user for a cup's associated beverage, but stored
  late int _beverageOrderForCup;
  late bool _beverageIsActiveForCup;
  late bool _beverageIsBuiltInForCup;

  List<Beverage> _beverages = [];

  @override
  void initState() {
    super.initState();
    _cupName = widget.cup?.name ?? '';
    _capacityML = widget.cup?.capacityML ?? 250;

    // Initialize beverage fields from widget.cup or defaults
    _beverageNameForCup = widget.cup?.beverageName ?? '';
    _beverageColorForCup = widget.cup?.beverageColor ?? ''; // Default color hex e.g. '#FFFFFF'
    _beverageIconForCup = widget.cup?.beverageIcon ?? ''; // Default icon identifier e.g. 'water_drop'
    _beverageHydrationForCup = widget.cup?.beverageHydration ?? 100.0; // Default hydration
    _beverageOrderForCup = widget.cup?.beverageOrder ?? 0;
    _beverageIsActiveForCup = widget.cup?.beverageIsActive ?? true;
    _beverageIsBuiltInForCup = widget.cup?.beverageIsBuiltIn ?? false;

    if (widget.cup?.beverageName != null && widget.cup!.beverageName!.isNotEmpty) {
      _selectedBeverage = Beverage()
        ..name = widget.cup!.beverageName
        ..color = widget.cup!.beverageColor
        ..icon = widget.cup!.beverageIcon
        ..hydration = widget.cup!.beverageHydration
        ..order = widget.cup!.beverageOrder ?? 0
        ..isActive = widget.cup!.beverageIsActive ?? true
        ..isBuiltIn = widget.cup!.beverageIsBuiltIn ?? false;
    }
    _loadBeverages();
  }

  Future<void> _loadBeverages() async {
    final beveragesFromDB = await BeverageDB.instance.getAll();
    if (!mounted) return;
    setState(() {
      _beverages = beveragesFromDB.where((b) => b.isActive == true).toList();
      if (_selectedBeverage != null) {
        final foundBeverage = _beverages.cast<Beverage?>().firstWhere(
          (b) => b?.name == _selectedBeverage!.name && b?.icon == _selectedBeverage!.icon && b?.color == _selectedBeverage!.color,
          orElse: () => null,
        );
        if (foundBeverage != null) {
          _selectedBeverage = foundBeverage;
          // Update form fields if a beverage is pre-selected and found
          _beverageNameForCup = foundBeverage.name ?? '';
          _beverageColorForCup = foundBeverage.color ?? '';
          _beverageIconForCup = foundBeverage.icon ?? '';
          _beverageHydrationForCup = foundBeverage.hydration ?? 100.0;
          _beverageOrderForCup = foundBeverage.order ?? 0;
          _beverageIsActiveForCup = foundBeverage.isActive ?? true;
          _beverageIsBuiltInForCup = foundBeverage.isBuiltIn ?? false;
        }
      }
    });
  }

  Future<void> _deleteCup() async {
    if (widget.cup != null && widget.cup!.id != null) {
      final db = CupDB.instance;
      await db.delete(widget.cup!.id!);
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('杯子已删除')),
        );
      }
    }
  }

  Future<void> _saveCup() async {
    print('Save button pressed'); // Log: Button press
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print('Form is valid'); // Log: Form validation success
      _formKey.currentState!.save();
      print('Form saved. Cup Name: $_cupName, Capacity: $_capacityML'); // Log: Form save success
      print('Beverage for cup - Name: $_beverageNameForCup, Color: $_beverageColorForCup, Icon: $_beverageIconForCup, Hydration: $_beverageHydrationForCup');

      final db = CupDB.instance;
      final cupToSave = widget.cup ?? Cup();
      cupToSave.name = _cupName;
      cupToSave.capacityML = _capacityML;

      if (_selectedBeverage != null) {
        print('Using selected beverage: ${_selectedBeverage!.name}'); // Log
        cupToSave.beverageName = _selectedBeverage!.name;
        cupToSave.beverageColor = _selectedBeverage!.color;
        cupToSave.beverageIcon = _selectedBeverage!.icon;
        cupToSave.beverageHydration = _selectedBeverage!.hydration;
        cupToSave.beverageOrder = _selectedBeverage!.order;
        cupToSave.beverageIsActive = _selectedBeverage!.isActive;
        cupToSave.beverageIsBuiltIn = _selectedBeverage!.isBuiltIn;
      } else {
        print('Using manually entered beverage details'); // Log
        cupToSave.beverageName = _beverageNameForCup.isNotEmpty ? _beverageNameForCup : null;
        cupToSave.beverageColor = _beverageColorForCup.isNotEmpty ? _beverageColorForCup : null;
        cupToSave.beverageIcon = _beverageIconForCup.isNotEmpty ? _beverageIconForCup : null;
        cupToSave.beverageHydration = _beverageHydrationForCup;
        cupToSave.beverageOrder = _beverageOrderForCup;
        cupToSave.beverageIsActive = _beverageIsActiveForCup;
        cupToSave.beverageIsBuiltIn = _beverageIsBuiltInForCup;
      }
      print('Cup object to save: ${cupToSave.name}, ${cupToSave.capacityML}, ${cupToSave.beverageName}'); // Log: Cup data before DB save

      try {
        await db.save(cupToSave);
        print('Cup saved to DB successfully. ID: ${cupToSave.id}'); // Log: DB save success
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('杯子已保存')),
          );
          Navigator.of(context).pop();
          print('Navigated back.'); // Log: Navigation
        }
      } catch (e) {
        print('Error saving cup to DB: $e'); // Log: DB save error
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('保存失败: $e')),
          );
        }
      }
    } else {
      print('Form is invalid or currentState is null'); // Log: Form validation failure
    }
  }

  void _showBeverageSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('选择饮品'),
          content: SizedBox(
            width: double.maxFinite,
            child: _beverages.isEmpty
                ? const Center(child: Text('没有可供选择的饮品。\n请先添加一些活跃的饮品。'))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _beverages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final beverage = _beverages[index];
                      return ListTile(
                        leading: Icon(beverage.displayIcon, color: beverage.displayColor),
                        title: Text(beverage.name ?? '未知饮品'),
                        subtitle: Text('${beverage.hydration ?? 0}% 水合度'),
                        onTap: () {
                          setState(() {
                            _selectedBeverage = beverage;
                            // Update form fields with selected beverage details
                            _beverageNameForCup = beverage.name ?? '';
                            _beverageColorForCup = beverage.color ?? '';
                            _beverageIconForCup = beverage.icon ?? '';
                            _beverageHydrationForCup = beverage.hydration ?? 100.0;
                            _beverageOrderForCup = beverage.order ?? 0;
                            _beverageIsActiveForCup = beverage.isActive ?? true;
                            _beverageIsBuiltInForCup = beverage.isBuiltIn ?? false;
                          });
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine display values for beverage based on _selectedBeverage or manual input state
    String displayBeverageName = _selectedBeverage?.name ?? _beverageNameForCup;
    Color displayBeverageColor = _selectedBeverage?.displayColor ?? (_beverageColorForCup.isNotEmpty ? Beverage.parseColor(_beverageColorForCup) : Colors.grey[300]!);    
    IconData displayBeverageIcon = _selectedBeverage?.displayIcon ?? (_beverageIconForCup.isNotEmpty ? Beverage.getIconDataFromString(_beverageIconForCup) : Icons.coffee_maker_outlined);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cup == null ? '添加杯子' : '编辑杯子'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (_selectedBeverage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Icon(
                          _selectedBeverage!.displayIcon,
                          size: 50,
                          color: _selectedBeverage!.displayColor,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _selectedBeverage!.name ?? '', 
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                TextFormField(
                  initialValue: _cupName,
                  decoration: const InputDecoration(labelText: '杯子名称'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入杯子名称';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cupName = value ?? ''; // Safer null handling
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: _capacityML.toString(),
                  decoration: const InputDecoration(labelText: '容量 (ml)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入容量';
                    }
                    final capacity = int.tryParse(value);
                    if (capacity == null) {
                      return '请输入有效的数字';
                    }
                    if (capacity <= 0) {
                      return '容量必须大于0';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _capacityML = int.tryParse(value ?? '0') ?? 250; // Safer null handling and default
                  },
                ),
                const SizedBox(height: 24),
                Text('关联饮品信息:', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                TextFormField(
                  // Use a Key to force rebuild when _beverageNameForCup changes due to selection
                  key: ValueKey('beverageName_${_beverageNameForCup}'), 
                  initialValue: _beverageNameForCup,
                  decoration: const InputDecoration(labelText: '饮品名称 (可选)'),
                  onChanged: (value) => setState(() { _beverageNameForCup = value; _selectedBeverage = null; }),
                  onSaved: (value) {
                    _beverageNameForCup = value ?? ''; // Safer null handling
                  },
                ),
                TextFormField(
                  key: ValueKey('beverageColor_${_beverageColorForCup}'),
                  initialValue: _beverageColorForCup,
                  decoration: const InputDecoration(labelText: '饮品颜色 (Hex, 可选, 例如: #FF0000)'),
                  onChanged: (value) => setState(() { _beverageColorForCup = value; _selectedBeverage = null; }),
                  onSaved: (value) {
                    _beverageColorForCup = value ?? ''; // Safer null handling
                  },
                ),
                TextFormField(
                  key: ValueKey('beverageIcon_${_beverageIconForCup}'),
                  initialValue: _beverageIconForCup,
                  decoration: const InputDecoration(labelText: '饮品图标 (标识符, 可选)'),
                  onChanged: (value) => setState(() { _beverageIconForCup = value; _selectedBeverage = null; }),
                  onSaved: (value) {
                    _beverageIconForCup = value ?? ''; // Safer null handling
                  },
                ),
                TextFormField(
                  key: ValueKey('beverageHydration_${_beverageHydrationForCup}'),
                  initialValue: _beverageHydrationForCup.toString(),
                  decoration: const InputDecoration(labelText: '饮品水合度 (%) (可选)'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() { 
                    _beverageHydrationForCup = double.tryParse(value) ?? 100.0; 
                    _selectedBeverage = null; 
                  }),
                  onSaved: (value) {
                    _beverageHydrationForCup = double.tryParse(value ?? '100.0') ?? 100.0; // Safer null handling and default
                  },
                  validator: (value) {
                    if (value != null && value.isNotEmpty && double.tryParse(value) == null) {
                      return '请输入有效的数字';
                    }
                    return null;
                  }
                ),
                const SizedBox(height: 16),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('或从列表选择饮品'),
                  subtitle: Text(displayBeverageName.isNotEmpty ? displayBeverageName : '未选择'),
                  leading: CircleAvatar(
                    backgroundColor: displayBeverageColor,
                    child: Icon(
                      displayBeverageIcon,
                      color: displayBeverageColor.computeLuminance() > 0.5 
                             ? Colors.black 
                             : Colors.white,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                  onTap: _showBeverageSelectionDialog,
                ),
                const SizedBox(height: 30),
                if (widget.cup != null) // Show delete button only when editing
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: _deleteCup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      label: const Text('删除杯子'),
                    ),
                  ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.save_alt_outlined),
                  onPressed: _saveCup,
                  style: ElevatedButton.styleFrom(
                     padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  label: const Text('保存杯子'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}