import 'package:flutter/material.dart';

class AppTheme {
  // Primary Colors - Teal Blue Gradient (Modern & Fresh)
  static const Color primaryTeal = Color(0xFF06B6D4);
  static const Color primaryBlue = Color(0xFF0EA5E9);
  static const Color primaryIndigo = Color(0xFF3B82F6);

  // Secondary Colors
  static const Color secondaryGreen = Color(0xFF10B981);
  static const Color secondaryOrange = Color(0xFFF97316);
  static const Color secondaryPurple = Color(0xFF8B5CF6);
  static const Color secondaryPink = Color(0xFFEC4899);

  // Neutral Colors
  static const Color textDark = Color(0xFF1F2937);
  static const Color textMedium = Color(0xFF6B7280);
  static const Color textLight = Color(0xFF9CA3AF);
  static const Color background = Color(0xFFF8FAFC);
  static const Color cardBackground = Colors.white;

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryTeal, primaryBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFFECFEFF), Colors.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [primaryTeal, primaryBlue, primaryIndigo],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Border Radius
  static BorderRadius borderRadiusSmall = BorderRadius.circular(8);
  static BorderRadius borderRadiusMedium = BorderRadius.circular(12);
  static BorderRadius borderRadiusLarge = BorderRadius.circular(16);
  static BorderRadius borderRadiusXLarge = BorderRadius.circular(20);
  static BorderRadius borderRadiusXXLarge = BorderRadius.circular(24);

  // Box Shadows
  static List<BoxShadow> shadowSmall = [
    BoxShadow(
      color: primaryTeal.withValues(alpha: 0.1),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> shadowMedium = [
    BoxShadow(
      color: primaryTeal.withValues(alpha: 0.2),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> shadowLarge = [
    BoxShadow(
      color: primaryTeal.withValues(alpha: 0.3),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  // Text Styles
  static const TextStyle headingXLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textDark,
    letterSpacing: 0.5,
  );

  static const TextStyle headingLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textDark,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textDark,
  );

  static const TextStyle headingSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textDark,
  );

  static const TextStyle bodyLarge = TextStyle(fontSize: 16, color: textMedium);

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    color: textMedium,
  );

  static const TextStyle bodySmall = TextStyle(fontSize: 12, color: textLight);

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // App Theme Data
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.cyan,
      fontFamily: 'Poppins',
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryTeal,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: borderRadiusXLarge),
        color: cardBackground,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: borderRadiusLarge),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: borderRadiusLarge,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadiusLarge,
          borderSide: BorderSide(color: Colors.grey[200]!, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadiusLarge,
          borderSide: const BorderSide(color: primaryTeal, width: 2),
        ),
      ),
    );
  }
}
