import 'package:flutter/material.dart';
import 'package:muhaseb_pro/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MuhasebPro',
      theme: AppTheme.lightTheme,
      home: const Scaffold(
        body: Center(
          child: Text('MuhasebPro Project Correctly Initialized'),
        ),
      ),
    );
  }
}