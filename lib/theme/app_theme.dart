import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Paleta de colores principal Taxiseguro
  static const Color appBlack = Color(0xFF050505);
  static const Color electricGreen = Color(0xFFC7FF2E);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color charcoal = Color(0xFF2E2E2E);
  static const Color midGray = Color(0xFF808080);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      // Colores base
      primaryColor: AppColors.electricGreen,
      scaffoldBackgroundColor: AppColors.pureWhite,
      
      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.electricGreen,
        onPrimary: AppColors.appBlack,
        secondary: AppColors.charcoal,
        onSecondary: AppColors.pureWhite,
        surface: AppColors.pureWhite,
        onSurface: AppColors.appBlack,
        error: Colors.redAccent,
      ),

      // Tipografías
      // Se utiliza Inter como fuente base para el cuerpo de texto,
      // y Google Sans para títulos y subtítulos.
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: const TextStyle(
          fontFamily: 'Google Sans',
          color: AppColors.appBlack,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: const TextStyle(
          fontFamily: 'Google Sans',
          color: AppColors.appBlack,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: const TextStyle(
          fontFamily: 'Google Sans',
          color: AppColors.appBlack,
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: const TextStyle(
          fontFamily: 'Google Sans',
          color: AppColors.appBlack,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: const TextStyle(
          fontFamily: 'Google Sans',
          color: AppColors.appBlack,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Configuración por defecto para componentes
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.pureWhite,
        foregroundColor: AppColors.appBlack,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appBlack,
          foregroundColor: AppColors.electricGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Google Sans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // Tema Oscuro Taxiseguro
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.electricGreen,
      scaffoldBackgroundColor: AppColors.appBlack,
      
      colorScheme: const ColorScheme.dark(
        primary: AppColors.electricGreen,
        onPrimary: AppColors.appBlack,
        secondary: AppColors.charcoal,
        onSecondary: AppColors.pureWhite,
        surface: AppColors.charcoal,
        onSurface: AppColors.pureWhite,
      ),

      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: const TextStyle(fontFamily: 'Google Sans', color: AppColors.pureWhite, fontWeight: FontWeight.bold),
        displayMedium: const TextStyle(fontFamily: 'Google Sans', color: AppColors.pureWhite, fontWeight: FontWeight.bold),
        titleLarge: const TextStyle(fontFamily: 'Google Sans', color: AppColors.pureWhite, fontWeight: FontWeight.bold),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.appBlack,
        foregroundColor: AppColors.pureWhite,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.electricGreen,
          foregroundColor: AppColors.appBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Google Sans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
