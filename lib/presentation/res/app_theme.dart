import 'package:flutter/material.dart';
import 'package:test_giphy_app/presentation/res/app_colors.dart';
import 'package:test_giphy_app/presentation/res/app_typography.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      // If [AppColors.onBackground] is changed, we want to be sure that changes are applied in [ThemeData]
      // ignore: avoid_redundant_argument_values
      onSurface: AppColors.onBackground,
    ),
    dividerColor: AppColors.border,
    scaffoldBackgroundColor: AppColors.background,
    iconTheme: const IconThemeData(
      color: AppColors.icon,
    ),
    fontFamily: 'Satoshi',
    textTheme: AppTypography.textTheme,
  );
}
