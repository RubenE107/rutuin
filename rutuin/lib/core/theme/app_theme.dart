import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xFF1E1E1E),
      fontFamily: 'Roboto',
      colorScheme: ColorScheme.dark(
        primary: Color(0xFF76FF03), // Verde lima
        secondary: Colors.white,
        background: Color(0xFF1E1E1E),
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[850],
        labelStyle: TextStyle(color: Colors.grey[400]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF76FF03),
          foregroundColor: Colors.black,
          textStyle: TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  static ThemeData get minimalLight {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(
        primary: Colors.black,
        secondary: Colors.grey[700]!,
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(color: Colors.grey[800]),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[200],
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  static ThemeData get intenseRed {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xFF1B1B1B),
      colorScheme: ColorScheme.dark(
        primary: Color(0xFFFF1744), // Rojo intenso
        secondary: Colors.white,
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.redAccent,
        ),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[850],
        labelStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFF1744),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
