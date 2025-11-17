import 'package:flutter/material.dart';
import 'package:test_giphy_app/domain/models/error/connection_server_error.dart';
import 'package:test_giphy_app/domain/models/error/server_error.dart';
import 'package:test_giphy_app/utils/extensions/localization_extensions.dart';
import 'package:test_giphy_app/utils/extensions/theme_extensions.dart';

class DefaultErrorWidget extends StatelessWidget {
  final Object? error;
  final VoidCallback? onRetry;
  final double iconSize;
  final double fontSize;

  const DefaultErrorWidget({
    super.key,
    required this.error,
    this.onRetry,
    this.iconSize = 16,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final strings = context.strings;

    final paddingValue = iconSize / 4;

    final errorMessage = switch (error) {
      ConnectionServerError() => strings.errorServerConnection,
      ServerError(:final message, :final code) => strings.errorWithCodeMessage((code ?? 0).toString(), message),
      String _ => error as String,
      _ => strings.errorUnknown,
    };

    return Center(
      child: Padding(
        padding: EdgeInsets.all(paddingValue),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: iconSize,
              color: theme.colorScheme.error,
            ),
            SizedBox(height: paddingValue),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.error,
                fontSize: fontSize,
              ),
            ),
            if (onRetry != null)
              Padding(
                padding: EdgeInsets.only(top: paddingValue),
                child: ElevatedButton(
                  onPressed: onRetry,
                  child: Text(strings.retry),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
