import 'package:flutter/material.dart';

class DefaultSliverAppBar extends SliverAppBar {
  const DefaultSliverAppBar({
    // Customized parameters
    super.floating = true,
    super.scrolledUnderElevation = 2,
    super.surfaceTintColor = Colors.transparent,
    super.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(100),
      ),
    ),
    super.titleSpacing = 0,
    // Other parameters
    super.key,
    super.leading,
    super.automaticallyImplyLeading = true,
    super.title,
    super.shadowColor,
    super.actions,
  });
}
