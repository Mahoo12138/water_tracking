import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:water_tracking/database/beverage_db.dart';
import 'package:water_tracking/database/entities/beverage.dart';
import 'package:water_tracking/pages/beverage/beverage_detail_page.dart';

class BeverageListPage extends StatefulWidget {
  const BeverageListPage({super.key});

  @override
  State<BeverageListPage> createState() => _BeverageListPageState();
}

class _BeverageListPageState extends State<BeverageListPage> {
  // 使用 signals_flutter 管理饮品列表状态
  final beverages = signal<List<Beverage>>([]);

  @override
  void initState() {
    super.initState();
    _loadBeverages();
  }

  Future<void> _loadBeverages() async {
    final db = BeverageDB.instance;
    final allBeverages = await db.getAll();
    // Sort beverages by the 'order' field
    allBeverages.sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));
    beverages.value = allBeverages;
  }

  @override
  Widget build(BuildContext context) {
    // Watch the signal to rebuild the UI when the list changes
    final currentBeverages = beverages.watch(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('饮品管理'),
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
                  builder: (context) => const BeverageDetailPage(),
                ),
              ).then((_) => _loadBeverages()); // Reload beverages after returning from detail page
            },
          ),
        ],
      ),
      body: ReorderableListView.builder(
          itemCount: currentBeverages.length,
          itemBuilder: (context, index) {
            final beverage = currentBeverages[index];
            return ListTile(
              key: ValueKey(beverage.id),
              leading: CircleAvatar(backgroundColor: Theme.of(context).colorScheme.surfaceVariant, child: Icon(beverage.displayIcon, color: beverage.displayColor)),
              title: Text(beverage.name ?? '未知饮品'),
              subtitle: Text('${beverage.hydration ?? 0}% Hydration'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BeverageDetailPage(beverage: beverage),
                  ),
                ).then((_) => _loadBeverages()); // Reload beverages after returning from detail page
              },
            );
          },
          onReorder: (oldIndex, newIndex) {
            // Current list from signal, create a mutable copy
            final List<Beverage> localListCopy = List.from(beverages.value);

            // Adjust index for remove/insert logic
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final Beverage item = localListCopy.removeAt(oldIndex);
            localListCopy.insert(newIndex, item);

            // Update 'order' property for all items in the reordered list
            for (int i = 0; i < localListCopy.length; i++) {
              localListCopy[i].order = i;
            }

            // Update the signal. This list is now structurally correct,
            // and its items have updated 'order' properties.
            // This synchronous update is crucial for ReorderableListView.
            beverages.value = localListCopy;

            // Asynchronously persist these changes and refresh from DB.
            _persistAndRefreshBeverages(localListCopy);
          }),
    );
  }

  // New async method for persistence and refresh
  Future<void> _persistAndRefreshBeverages(List<Beverage> listToPersist) async {
    final db = BeverageDB.instance;
    // The items in listToPersist already have their 'order' property correctly set.
    await db.saveAll(listToPersist);

    // UI is already updated optimistically by setting beverages.value directly in onReorder.
    // No need to call _loadBeverages() here, as it would cause a flicker.
  }
}
