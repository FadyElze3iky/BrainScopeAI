import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    // Primary color for the app
    primaryColor: Color(0xFF4A90E2), // Soft blue
    scaffoldBackgroundColor: Color(0xFFF5F5F5), // Light grey background

    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFF5F5F5), // Match background
      elevation: 0, // Flat design
      titleTextStyle: TextStyle(
        color: Color(0xFF333333), // Dark grey for title
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Rubik',
      ),
      iconTheme: IconThemeData(color: Color(0xFF4A90E2)), // Blue icons
    ),

    // Text theme for typography
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333),
          fontFamily: 'Rubik'),
      bodyLarge: TextStyle(
          fontSize: 20,
          color: Color(0xFF333333),
          fontFamily: 'Rubik',
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
          fontSize: 18, color: Color(0xFF666666), fontFamily: 'Rubik'),
      labelSmall: TextStyle(
          fontSize: 16, color: Color(0xFF666666), fontFamily: 'Rubik'),
    ),

    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(203, 49, 145, 255), // Blue button
        foregroundColor: Colors.white, // White text/icon
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // Card theme for sections
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    // Icon theme
    iconTheme: IconThemeData(
      color: Color(0xFF4A90E2), // Blue icons
      size: 24,
    ),

    // Progress indicators (e.g., CircularProgressIndicator)
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Color(0xFF4A90E2), // Blue for progress
      linearTrackColor: Color(0xFFD3D3D3), // Grey for pending
    ),
  );
}
