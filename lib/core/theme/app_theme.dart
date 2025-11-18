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
      textTheme: GoogleFonts.dmSansTextTheme().copyWith(
        headlineLarge: GoogleFonts.dmSans(fontWeight: FontWeight.w700),
        headlineMedium: GoogleFonts.dmSans(fontWeight: FontWeight.w700),
        headlineSmall: GoogleFonts.dmSans(fontWeight: FontWeight.w700),
        titleLarge: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
        titleMedium: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
        titleSmall: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
        bodyLarge: GoogleFonts.dmSans(),
        bodyMedium: GoogleFonts.dmSans(),
        bodySmall: GoogleFonts.dmSans(),
        labelLarge: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
        labelMedium: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
        labelSmall: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
      ),
      useMaterial3: false,
      scaffoldBackgroundColor: lightBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: lightBackgroundColor,
        foregroundColor: lightTextPrimaryColor,
        elevation: 0,
        titleTextStyle: GoogleFonts.dmSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: lightTextPrimaryColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
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
      textTheme: GoogleFonts.dmSansTextTheme(
        TextTheme(
          headlineLarge: GoogleFonts.dmSans(color: darkTextPrimaryColor, fontWeight: FontWeight.w700),
          headlineMedium: GoogleFonts.dmSans(color: darkTextPrimaryColor, fontWeight: FontWeight.w700),
          headlineSmall: GoogleFonts.dmSans(color: darkTextPrimaryColor, fontWeight: FontWeight.w700),
          titleLarge: GoogleFonts.dmSans(color: darkTextPrimaryColor, fontWeight: FontWeight.w600),
          titleMedium: GoogleFonts.dmSans(color: darkTextPrimaryColor, fontWeight: FontWeight.w600),
          titleSmall: GoogleFonts.dmSans(color: darkTextPrimaryColor, fontWeight: FontWeight.w600),
          bodyLarge: GoogleFonts.dmSans(color: darkTextPrimaryColor),
          bodyMedium: GoogleFonts.dmSans(color: darkTextPrimaryColor),
          bodySmall: GoogleFonts.dmSans(color: darkTextPrimaryColor),
          labelLarge: GoogleFonts.dmSans(color: darkTextPrimaryColor, fontWeight: FontWeight.w600),
          labelMedium: GoogleFonts.dmSans(color: darkTextPrimaryColor, fontWeight: FontWeight.w600),
          labelSmall: GoogleFonts.dmSans(color: darkTextPrimaryColor, fontWeight: FontWeight.w600),
        ),
      ),
      useMaterial3: false,
      scaffoldBackgroundColor: darkBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: darkBackgroundColor,
        foregroundColor: darkTextPrimaryColor,
        elevation: 0,
        titleTextStyle: GoogleFonts.dmSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: darkTextPrimaryColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
