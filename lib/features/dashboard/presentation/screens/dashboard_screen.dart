import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ), // AppBar is not const by default
      body: Center( // Center can be const
        child: Text('Dashboard Screen'), // Text can be const
      ),
    ); // Scaffold can be const if its children are const or themselves contain const subtrees
  }
}