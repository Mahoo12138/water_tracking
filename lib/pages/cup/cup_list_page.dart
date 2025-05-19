import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:water_tracking/database/cup_db.dart';
import 'package:water_tracking/database/entities/cup.dart';
import 'package:water_tracking/database/entities/beverage.dart'; // Import Beverage for parsing color/icon
import 'package:water_tracking/pages/cup/cup_detail_page.dart';

class CupListPage extends StatefulWidget {
  const CupListPage({super.key});

  @override
  State<CupListPage> createState() => _CupListPageState();
}

class _CupListPageState extends State<CupListPage> {
  final cups = signal<List<Cup>>([]);

  @override
  void initState() {
    super.initState();
    _loadCups();
  }

  Future<void> _loadCups() async {
    final db = CupDB.instance;
    final allCups = await db.getAll();
    // Sort by order field. Ensure 'Cup' entity has 'order' field.
    allCups.sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));
    cups.value = allCups;
  }

  @override
  Widget build(BuildContext context) {
    final currentCups = cups.watch(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('杯子管理'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CupDetailPage(),
                ),
              ).then((_) => _loadCups());
            },
          ),
        ],
      ),
      body: ReorderableListView.builder(
          itemCount: currentCups.length,
          itemBuilder: (context, index) {
            final cup = currentCups[index];
            
            // Determine icon and color for the CircleAvatar
            IconData displayIcon = Icons.coffee_maker_outlined; // Default icon
            Color backgroundColor = Colors.grey[300]!; // Default background color
            Color iconColor = Colors.black;

            if (cup.beverageIcon != null && cup.beverageIcon!.isNotEmpty) {
              displayIcon = Beverage.getIconDataFromString(cup.beverageIcon!);
            }
            if (cup.beverageColor != null && cup.beverageColor!.isNotEmpty) {
              backgroundColor = Beverage.parseColor(cup.beverageColor!);
              iconColor = backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
            }

            return ListTile(
              key: ValueKey(cup.id),
              leading: CircleAvatar(
                backgroundColor: backgroundColor,
                child: Icon(displayIcon, color: iconColor),
              ),
              title: Text(cup.name ?? '未知杯子'),
              subtitle: Text(
                  '${cup.capacityML ?? 0}ml - ${cup.beverageName ?? '未指定饮品'}'),
              trailing: const Icon(Icons.drag_handle), // Added drag handle
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CupDetailPage(cup: cup),
                  ),
                ).then((_) => _loadCups());
              },
            );
          },
          onReorder: (oldIndex, newIndex) {
            final List<Cup> localListCopy = List.from(cups.value);

            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final Cup item = localListCopy.removeAt(oldIndex);
            localListCopy.insert(newIndex, item);

            // Update 'order' property for all items in the reordered list
            for (int i = 0; i < localListCopy.length; i++) {
              localListCopy[i].order = i;
            }

            cups.value = localListCopy;
            _persistAndRefreshCups(localListCopy);
          }),
    );
  }

  Future<void> _persistAndRefreshCups(List<Cup> listToPersist) async {
    final db = CupDB.instance;
    // The items in listToPersist already have their 'order' property correctly set.
    await db.saveAll(listToPersist);
    // Optionally, reload to confirm, though optimistic update should suffice
    // await _loadCups(); 
  }
}
