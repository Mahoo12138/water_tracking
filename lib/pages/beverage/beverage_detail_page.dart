import 'package:flutter/material.dart';
import 'package:water_tracking/database/beverage_db.dart';
import 'package:water_tracking/database/entities/beverage.dart';

class BeverageDetailPage extends StatefulWidget {
  final Beverage? beverage;

  const BeverageDetailPage({super.key, this.beverage});

  @override
  State<BeverageDetailPage> createState() => _BeverageDetailPageState();
}

class _BeverageDetailPageState extends State<BeverageDetailPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _color;
  late String _icon;
  late double _hydration;
  late bool _isActive;
  late bool _isBuiltIn;

  @override
  void initState() {
    super.initState();
    _name = widget.beverage?.name ?? '';
    _color = widget.beverage?.color ?? '';
    _icon = widget.beverage?.icon ?? '';
    _hydration = widget.beverage?.hydration ?? 0.0;
    _isActive = widget.beverage?.isActive ?? true;
    _isBuiltIn = widget.beverage?.isBuiltIn ?? false;
  }

  Future<void> _deleteBeverage() async {
    if (widget.beverage != null && widget.beverage!.id != null) {
      final db = BeverageDB.instance;
      await db.delete(widget.beverage!.id!);
      Navigator.of(context).pop();
      // Optionally, show a confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('饮品已删除')),
      );
    } else {
      // Handle case where beverage is null or has no ID (should not happen if delete button is shown correctly)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('无法删除饮品')),
      );
    }
  }

  Future<void> _saveBeverage() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final db = BeverageDB.instance;
      final beverageToSave = widget.beverage ?? Beverage();
      beverageToSave.name = _name;
      beverageToSave.color = _color;
      beverageToSave.icon = _icon;
      beverageToSave.hydration = _hydration;
      beverageToSave.isActive = _isActive;
      beverageToSave.isBuiltIn = _isBuiltIn;

      await db.save(beverageToSave);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.beverage == null ? '添加饮品' : '编辑饮品'),
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (widget.beverage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Icon(
                    widget.beverage!.displayIcon,
                    size: 64,
                    color: widget.beverage!.displayColor,
                  ),
                ),
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: '名称'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入饮品名称';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: _color,
                decoration: const InputDecoration(labelText: '颜色'),
                onSaved: (value) {
                  _color = value!;
                },
              ),
              TextFormField(
                initialValue: _icon,
                decoration: const InputDecoration(labelText: '图标'),
                onSaved: (value) {
                  _icon = value!;
                },
              ),
              TextFormField(
                initialValue: _hydration.toString(),
                decoration: const InputDecoration(labelText: '水合度 (%)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入水合度';
                  }
                  if (double.tryParse(value) == null) {
                    return '请输入有效的数字';
                  }
                  return null;
                },
                onSaved: (value) {
                  _hydration = double.parse(value!);
                },
              ),
              CheckboxListTile(
                title: const Text('是否活跃'),
                value: _isActive,
                onChanged: (value) {
                  setState(() {
                    _isActive = value ?? true;
                  });
                },
              ),
              if (widget.beverage != null && widget.beverage?.isBuiltIn == false)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    onPressed: _deleteBeverage,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('删除'),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                  onPressed: _saveBeverage,
                  child: const Text('保存'),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}