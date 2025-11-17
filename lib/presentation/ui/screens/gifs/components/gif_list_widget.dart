import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/presentation/ui/components/default_error_widget.dart';
import 'package:test_giphy_app/presentation/ui/enums/screen_size.dart';
import 'package:test_giphy_app/presentation/ui/screens/gifs/components/default_progress_indicator.dart';
import 'package:test_giphy_app/presentation/ui/screens/gifs/components/gif_widget.dart';
import 'package:test_giphy_app/utils/extensions/localization_extensions.dart';

class GifListWidget extends StatelessWidget {
  final PagingController<int, Gif> controller;
  final bool animateGifs;

  const GifListWidget({
    super.key,
    required this.controller,
    this.animateGifs = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize.fromSize(
      MediaQuery.sizeOf(context),
    );

    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: switch (screenSize) {
        ScreenSize.small => _baseCrossAxisGifCount,
        ScreenSize.medium => _baseCrossAxisGifCount + _crossAxisCountIncrement,
        ScreenSize.expanded => _baseCrossAxisGifCount + _crossAxisCountIncrement * 2,
        ScreenSize.large => _baseCrossAxisGifCount + _crossAxisCountIncrement * 3,
        ScreenSize.extraLarge => _baseCrossAxisGifCount + _crossAxisCountIncrement * 4,
      },
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
    );

    final strings = context.strings;

    return PagedSliverGrid<int, Gif>(
      pagingController: controller,
      showNewPageErrorIndicatorAsGridChild: false,
      gridDelegate: gridDelegate,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) => GifWidget(
          gif: item,
          isAnimated: animateGifs,
          screenSize: screenSize,
        ),
        firstPageProgressIndicatorBuilder: (context) => const DefaultProgressIndicator(),
        firstPageErrorIndicatorBuilder: (context) => DefaultErrorWidget(
          error: controller.error ?? strings.errorLoadingGifs,
          onRetry: controller.refresh,
          iconSize: 64,
          fontSize: 32,
        ),
        newPageProgressIndicatorBuilder: (_) => const DefaultProgressIndicator(),
        newPageErrorIndicatorBuilder: (context) => DefaultErrorWidget(error: strings.errorLoadingMoreGifs),
        noItemsFoundIndicatorBuilder: (context) => Center(child: Text(strings.emptyNoGifsFound)),
      ),
    );
  }

  static const int _baseCrossAxisGifCount = 3;
  static const int _crossAxisCountIncrement = 1;
}
