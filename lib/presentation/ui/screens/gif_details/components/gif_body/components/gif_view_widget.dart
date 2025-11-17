import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/presentation/ui/components/default_error_widget.dart';
import 'package:test_giphy_app/utils/extensions/localization_extensions.dart';
import 'package:test_giphy_app/utils/extensions/theme_extensions.dart';

class GifViewWidget extends StatelessWidget {
  final Gif gif;

  const GifViewWidget({
    super.key,
    required this.gif,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strings = context.strings;

    final original = gif.images?.original;

    final width = original?.width ?? 1;
    final height = original?.height ?? 1;

    return SizedBox(
      width: width.toDouble(),
      child: AspectRatio(
        aspectRatio: width / height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            original?.url ?? '',
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }

              return Shimmer(
                color: colors.secondary,
                child: ColoredBox(
                  color: colors.onSecondary,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) => DefaultErrorWidget(error: strings.errorLoading),
          ),
        ),
      ),
    );
  }
}
