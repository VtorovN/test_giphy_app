import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension ColorExtension on BuildContext {
  ColorScheme get colors => theme.colorScheme;
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => theme.textTheme;
}
