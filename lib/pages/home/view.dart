import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:water_tracking/pages/analytics/screen.dart';
import 'package:water_tracking/pages/drinking/screen.dart';
import 'package:water_tracking/pages/settings/screen.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  final List<NavigationDestination> destinations = const [
    NavigationDestination(
      icon: Icon(Icons.home),
      label: "Home",
      selectedIcon: Icon(Icons.home_outlined),
    ),
    NavigationDestination(
      icon: Icon(Icons.analytics),
      label: "Analytics",
      selectedIcon: Icon(Icons.analytics_outlined),
    ),
    NavigationDestination(
      icon: Icon(Icons.settings),
      label: "Settings",
      selectedIcon: Icon(Icons.settings_outlined),
    ),
  ];

  final navigatorBarHeight = 56.0;

  @override
  Widget build(BuildContext context) {
    final navigatorIndex = useState(0);
    final pageController = usePageController(initialPage: 0);
    // final padding = MediaQuery.paddingOf(context);
    final width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    // final size = MediaQuery.sizeOf(context);
    // final textStyle = Theme.of(context).textTheme;

    Widget buildNavigatorBar() {
      // var maxHeight = navigatorBarHeight + padding.bottom;
      return width < 600
          ? Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: colorScheme.outline.withAlpha(150), width: 0.5)),
              ),
              child: Stack(
                children: [
                  NavigationBar(
                    destinations: destinations,
                    selectedIndex: navigatorIndex.value,
                    height: navigatorBarHeight,
                    onDestinationSelected: (index) {
                      navigatorIndex.value = index;
                      pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut);
                    },
                    labelBehavior:
                        NavigationDestinationLabelBehavior.alwaysHide,
                  ),
                  // buildModal()
                ],
              ),
            )
          : const SizedBox.shrink();
    }

    Widget buildLayout() {
      return AdaptiveLayout(
        transitionDuration: const Duration(milliseconds: 200),
        primaryNavigation: SlotLayout(config: {
          Breakpoints.medium: SlotLayout.from(
            key: const ValueKey('primary navigation medium'),
            builder: (_) {
              return AdaptiveScaffold.standardNavigationRail(
                destinations: destinations
                    .map((destination) =>
                        AdaptiveScaffold.toRailDestination(destination))
                    .toList(),
                selectedIndex: navigatorIndex.value,
                onDestinationSelected: (index) {
                  navigatorIndex.value = index;
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut);
                },
              );
            },
          ),
          Breakpoints.mediumLargeAndUp: SlotLayout.from(
            key: const ValueKey('primary navigation medium large'),
            builder: (_) => AdaptiveScaffold.standardNavigationRail(
              destinations: destinations
                  .map((destination) =>
                      AdaptiveScaffold.toRailDestination(destination))
                  .toList(),
              extended: true,
              selectedIndex: navigatorIndex.value,
              onDestinationSelected: (index) {
                navigatorIndex.value = index;
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
              },
            ),
          ),
        }),
        body: SlotLayout(config: {
          Breakpoints.standard: SlotLayout.from(
              key: const ValueKey('body'),
              builder: (_) => PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      DrinkingPage(),
                      AnalyticsPage(),
                      SettingsPage(),
                    ],
                  )),
        }),
      );
    }

    return Scaffold(
      bottomNavigationBar: buildNavigatorBar(),
      body: Stack(
        children: [buildLayout()],
      ),
    );
  }
}
