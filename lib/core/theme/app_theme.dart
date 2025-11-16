import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light Theme Colors
  static const Color primaryColor = Color(0xFF4F46E5);
  static const Color lightBackgroundColor = Colors.white;
  static const Color lightTextPrimaryColor = Color(0xFF111111);
  static const Color lightTextSecondaryColor = Color(0xFF666666);

  // Dark Theme Colors
  static const Color darkBackgroundColor = Color(0xFF1A1A2E);
  static const Color darkSurfaceColor = Color(0xFF16213E);
  static const Color darkTextPrimaryColor = Color(0xFFEEEEEE);
  static const Color darkTextSecondaryColor = Color(0xFFB0B0B0);

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
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
      useMaterial3: false,
      scaffoldBackgroundColor: lightBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: lightBackgroundColor,
        foregroundColor: lightTextPrimaryColor,
        elevation: 0,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: lightTextPrimaryColor,
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

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.interTextTheme(
        TextTheme(
          headlineLarge: GoogleFonts.inter(color: darkTextPrimaryColor),
          headlineMedium: GoogleFonts.inter(color: darkTextPrimaryColor),
          headlineSmall: GoogleFonts.inter(color: darkTextPrimaryColor),
          titleLarge: GoogleFonts.inter(color: darkTextPrimaryColor),
          titleMedium: GoogleFonts.inter(color: darkTextPrimaryColor),
          titleSmall: GoogleFonts.inter(color: darkTextPrimaryColor),
          bodyLarge: GoogleFonts.inter(color: darkTextPrimaryColor),
          bodyMedium: GoogleFonts.inter(color: darkTextPrimaryColor),
          bodySmall: GoogleFonts.inter(color: darkTextPrimaryColor),
          labelLarge: GoogleFonts.inter(color: darkTextPrimaryColor),
          labelMedium: GoogleFonts.inter(color: darkTextPrimaryColor),
          labelSmall: GoogleFonts.inter(color: darkTextPrimaryColor),
        ),
      ),
      useMaterial3: false,
      scaffoldBackgroundColor: darkBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: darkBackgroundColor,
        foregroundColor: darkTextPrimaryColor,
        elevation: 0,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: darkTextPrimaryColor,
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
