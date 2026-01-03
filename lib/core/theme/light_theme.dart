import 'package:flutter/material.dart';

import 'package:health_tracker_app/utils/color/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  fontFamily: 'Urbanist',
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w800,
      fontSize: 18,
      color: AppColors.primaryColor,
    ),
    iconTheme: IconThemeData(color: AppColors.grayTertiaryTextColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.white,
      minimumSize: const Size(140, 32),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

      textStyle: const TextStyle(
        fontFamily: 'Urbanist',
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.primaryColor),
      foregroundColor: AppColors.primaryColor,
      minimumSize: const Size(double.infinity, 50),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      textStyle: const TextStyle(
        fontFamily: 'Urbanist',
        fontSize:
            16, // Image looks slightly larger than 14, defaulting to 16 for "button" size
        fontWeight: FontWeight.w700, // Bold as per image
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      textStyle: const TextStyle(
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        decoration: TextDecoration.underline,
      ),
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.grayTertiaryTextColor),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.backgroundColor,
    iconColor: AppColors.grayTextSecondaryColor,
    prefixIconColor: AppColors.grayTertiaryTextColor,
    suffixIconColor: AppColors.grayTertiaryTextColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.linesDarkColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.linesDarkColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: AppColors.redColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: AppColors.redColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.linesDarkColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.linesDarkColor),
    ),
    hintStyle: const TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.grayTertiaryTextColor,
    ),
    errorStyle: const TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.redColor,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 32,
      fontWeight: FontWeight.w800,
      color: AppColors.blackMainTextColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 28,
      fontWeight: FontWeight.w800,
      color: AppColors.blackMainTextColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: AppColors.blackMainTextColor,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.blackMainTextColor,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.blackMainTextColor,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.blackMainTextColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.blackMainTextColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.blackMainTextColor,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.blackMainTextColor,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.grayTertiaryTextColor,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.blackMainTextColor,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.grayTertiaryTextColor,
    ),
  ),
);
