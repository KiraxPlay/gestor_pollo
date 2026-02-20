
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFB6E000);

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      primaryColor: primaryColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.black,
      ),
    );
  }
}
