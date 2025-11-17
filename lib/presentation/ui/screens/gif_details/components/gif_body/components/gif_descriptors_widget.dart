import 'package:flutter/material.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/presentation/ui/screens/gif_details/components/gif_body/components/metadata/gif_metadata.dart';
import 'package:test_giphy_app/utils/extensions/localization_extensions.dart';
import 'package:test_giphy_app/utils/extensions/theme_extensions.dart';

class GifDescriptorsWidget extends StatelessWidget {
  final Gif gif;

  const GifDescriptorsWidget({
    super.key,
    required this.gif,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final strings = context.strings;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          gif.title?.trim().isNotEmpty == true ? gif.title! : strings.gifUntitled,
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Flexible(
          child: GifMetadata(gif: gif),
        ),
        const SizedBox(height: 12),
        if (gif.altText?.isNotEmpty == true)
          Text(
            gif.altText!,
            style: textTheme.bodyMedium,
          ),
      ],
    );
  }
}
