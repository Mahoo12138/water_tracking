import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnalyticsPage extends HookWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Analytics'),
      ),
    );
  }
}
