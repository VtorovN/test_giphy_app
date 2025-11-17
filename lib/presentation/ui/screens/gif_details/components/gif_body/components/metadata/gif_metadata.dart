import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/presentation/ui/screens/gif_details/components/gif_body/components/metadata/components/metadata_chip.dart';
import 'package:test_giphy_app/utils/extensions/localization_extensions.dart';

class GifMetadata extends StatelessWidget {
  final Gif gif;

  const GifMetadata({
    super.key,
    required this.gif,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    late final String date;

    if (gif.importDatetime == null) {
      date = strings.dateUnknown;
    } else {
      date = DateFormat.yMMMMEEEEd().format(gif.importDatetime!);
    }

    return Wrap(
      spacing: 12,
      runSpacing: 4,
      children: [
        if (gif.username?.isNotEmpty ?? false)
          MetadataChip(
            icon: Icons.person,
            label: gif.username!,
          ),
        if (gif.rating?.isNotEmpty ?? false)
          MetadataChip(
            icon: Icons.shield,
            label: strings.metadataRating(gif.rating!),
          ),
        MetadataChip(
          icon: Icons.calendar_month,
          label: strings.metadataUploaded(date),
        ),
        if (gif.isLowContrast ?? false)
          MetadataChip(
            icon: Icons.contrast,
            label: strings.metadataLowContrast,
          ),
      ],
    );
  }
}
