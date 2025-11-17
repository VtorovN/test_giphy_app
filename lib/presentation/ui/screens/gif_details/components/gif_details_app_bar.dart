import 'package:flutter/cupertino.dart';
import 'package:test_giphy_app/presentation/ui/components/default_sliver_app_bar.dart';
import 'package:test_giphy_app/utils/extensions/localization_extensions.dart';
import 'package:test_giphy_app/utils/extensions/theme_extensions.dart';

class GifDetailsAppBar extends StatelessWidget {
  const GifDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return DefaultSliverAppBar(
      shadowColor: context.colors.onSurface,
      shape: const RoundedRectangleBorder(),
      title: Text(
        strings.titleGifDetails,
        style: context.textTheme.headlineMedium,
      ),
    );
  }
}
