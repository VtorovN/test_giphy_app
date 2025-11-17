import 'dart:ui';

/// Screen sizes for responsive design.
///
/// Breakpoints taken from Material Design guidelines.
/// https://m3.material.io/foundations/layout/applying-layout/window-size-classes
enum ScreenSize {
  small,
  medium,
  expanded,
  large,
  extraLarge
  ;

  static ScreenSize fromSize(Size size) {
    final width = size.width;

    return switch (width) {
      < _smallBreakpoint => ScreenSize.small,
      < _mediumBreakpoint => ScreenSize.medium,
      < _expandedBreakpoint => ScreenSize.expanded,
      < _largeBreakpoint => ScreenSize.large,
      _ => ScreenSize.extraLarge,
    };
  }

  static const double _smallBreakpoint = 600;
  static const double _mediumBreakpoint = 840;
  static const double _expandedBreakpoint = 1200;
  static const double _largeBreakpoint = 1600;
}
