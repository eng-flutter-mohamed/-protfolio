import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_styles.dart';

abstract class CustomTheme {
  static ThemeData lightTheme() => ThemeData.light();
  static ThemeData darkTheme() => ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.dark,
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
          background: AppColors.scaffoldColor,
          surface: AppColors.cardColor,
          onPrimary: AppColors.white,
          onSecondary: AppColors.white,
        ),
        textTheme: TextTheme(
          bodyMedium: AppStyles.s16.copyWith(color: AppColors.white),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.white,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.primaryLight,
          filled: true,
          labelStyle: AppStyles.s14,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
}
