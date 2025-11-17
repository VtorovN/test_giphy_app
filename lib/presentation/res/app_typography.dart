import 'package:flutter/material.dart';
import 'package:test_giphy_app/presentation/res/app_colors.dart';

class AppTypography {
  AppTypography._();

  static final textTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 33,
      fontWeight: FontWeight.bold,
      color: AppColors.onBackground,
    ),
    headlineMedium: TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.w400,
      color: AppColors.onBackground,
    ),
    headlineSmall: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w400,
      color: AppColors.onBackground,
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.onBackground,
    ),
    titleMedium: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w400,
      color: AppColors.onBackground,
    ),
    titleSmall: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: AppColors.onBackground,
    ),
    bodyLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w400,
      color: AppColors.onBackground,
    ),
    labelMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: AppColors.onBackground,
    ),
  );
}
