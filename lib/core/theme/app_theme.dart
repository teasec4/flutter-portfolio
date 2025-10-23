import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF4F46E5);
  static const Color backgroundColor = Colors.white;
  static const Color textPrimaryColor = Color(0xFF111111);
  static const Color textSecondaryColor = Color(0xFF666666);

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        // Ensure Inter font is used throughout
        headlineLarge: GoogleFonts.inter(),
        headlineMedium: GoogleFonts.inter(),
        headlineSmall: GoogleFonts.inter(),
        titleLarge: GoogleFonts.inter(),
        titleMedium: GoogleFonts.inter(),
        titleSmall: GoogleFonts.inter(),
        bodyLarge: GoogleFonts.inter(),
        bodyMedium: GoogleFonts.inter(),
        bodySmall: GoogleFonts.inter(),
        labelLarge: GoogleFonts.inter(),
        labelMedium: GoogleFonts.inter(),
        labelSmall: GoogleFonts.inter(),
      ),
      useMaterial3: false, // Disable Material 3 for cleaner look
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: textPrimaryColor,
        elevation: 0,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: textPrimaryColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
