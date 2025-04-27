import 'package:flutter/material.dart';

ThemeData appThemeLight() {
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
      bodySmall: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 94, 94, 94),
          fontFamily: 'Rubik'),
      labelSmall: TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 88, 88, 88),
          fontFamily: 'Rubik'),
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

ThemeData appThemeDark() {
  return ThemeData(
    // Primary color for the app
    primaryColor: Color(0xFF4A90E2), // Soft blue (retained for consistency)
    scaffoldBackgroundColor: Color(0xFF121212), // Dark grey background

    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF121212), // Match dark background
      elevation: 0, // Flat design
      titleTextStyle: TextStyle(
        color: Color(0xFFE0E0E0), // Light grey for title
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Rubik',
      ),
      iconTheme:
          IconThemeData(color: Color(0xFF4A90E2)), // Blue icons (retained)
    ),

    // Text theme for typography
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFFE0E0E0), // Light grey
          fontFamily: 'Rubik'),
      bodyLarge: TextStyle(
          fontSize: 20,
          color: Color(0xFFE0E0E0), // Light grey
          fontFamily: 'Rubik',
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
          fontSize: 18,
          color: Color(0xFFB0B0B0), // Medium grey
          fontFamily: 'Rubik'),
      bodySmall: TextStyle(
          fontSize: 16,
          color: Color(0xFF9E9E9E), // Slightly darker grey
          fontFamily: 'Rubik'),
      labelSmall: TextStyle(
          fontSize: 14,
          color: Color(0xFF8D8D8D), // Darker grey
          fontFamily: 'Rubik'),
    ),

    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF4A90E2), // Blue button (slightly brighter)
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
      color: Color(0xFF1E1E1E), // Darker card background
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    // Icon theme
    iconTheme: IconThemeData(
      color: Color(0xFF4A90E2), // Blue icons (retained)
      size: 24,
    ),

    // Progress indicators (e.g., CircularProgressIndicator)
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Color(0xFF4A90E2), // Blue for progress (retained)
      linearTrackColor: Color(0xFF616161), // Darker grey for pending
    ),
  );
}
