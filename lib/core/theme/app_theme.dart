import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'NotoSansArabic',
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF005B96),
        brightness: Brightness.light,
      ),
      inputDecorationTheme: const InputDecorationTheme( // Fixed syntax
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'NotoSansArabic',
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF005B96),
        brightness: Brightness.dark,
      ),
      inputDecorationTheme: const InputDecorationTheme( // Fixed syntax
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}