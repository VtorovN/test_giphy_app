import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/presentation/ui/components/default_error_widget.dart';
import 'package:test_giphy_app/presentation/ui/enums/screen_size.dart';
import 'package:test_giphy_app/routing/app_router.gr.dart';
import 'package:test_giphy_app/utils/extensions/localization_extensions.dart';
import 'package:test_giphy_app/utils/extensions/theme_extensions.dart';

class GifWidget extends StatelessWidget {
  final Gif gif;
  final bool isAnimated;
  final ScreenSize screenSize;

  const GifWidget({
    super.key,
    required this.gif,
    required this.isAnimated,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final imagesObj = gif.images;
    final strings = context.strings;

    final image = switch ((screenSize, isAnimated)) {
      (ScreenSize.small, true) => imagesObj?.fixedWidthSmall,
      (ScreenSize.small, false) => imagesObj?.fixedWidthSmallStill,
      (_, true) => imagesObj?.fixedWidth,
      (_, false) => imagesObj?.fixedWidthStill,
    };

    return GestureDetector(
      onTap: () => context.pushRoute(
        GifDetailsPage(
          gif: gif,
          id: gif.id,
        ),
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.network(
          image?.url ?? '',
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
    );
  }
}
