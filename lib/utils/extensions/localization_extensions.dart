import 'package:flutter/material.dart';
import 'package:test_giphy_app/presentation/res/localization/app_localizations.dart';

/// Provides easy access to localized strings via `context.strings`.
extension LocalizationExtension on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this);
}
