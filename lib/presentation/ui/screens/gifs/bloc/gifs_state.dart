import 'package:test_giphy_app/domain/models/gif.dart';

sealed class GifsState {
  final bool isAnimationEnabled;

  const GifsState({
    this.isAnimationEnabled = true,
  });

  GifsState copyWith({
    bool? isAnimationEnabled,
  });
}

final class GifsInitial extends GifsState {
  const GifsInitial({
    super.isAnimationEnabled,
  });

  @override
  GifsInitial copyWith({
    bool? isAnimationEnabled,
  }) {
    return GifsInitial(isAnimationEnabled: isAnimationEnabled ?? this.isAnimationEnabled);
  }
}

final class GifsLoading extends GifsState {
  const GifsLoading({
    super.isAnimationEnabled,
  });

  @override
  GifsLoading copyWith({
    bool? isAnimationEnabled,
  }) {
    return GifsLoading(isAnimationEnabled: isAnimationEnabled ?? this.isAnimationEnabled);
  }
}

final class GifsError extends GifsState {
  final Object error;

  const GifsError({
    required this.error,
    super.isAnimationEnabled,
  });

  @override
  GifsError copyWith({
    Object? error,
    bool? isAnimationEnabled,
  }) {
    return GifsError(
      error: error ?? this.error,
      isAnimationEnabled: isAnimationEnabled ?? this.isAnimationEnabled,
    );
  }
}

final class GifsLoaded extends GifsState {
  final List<Gif> gifs;

  const GifsLoaded({
    required this.gifs,
    super.isAnimationEnabled,
  });

  @override
  GifsLoaded copyWith({
    List<Gif>? gifs,
    bool? isAnimationEnabled,
  }) {
    return GifsLoaded(gifs: gifs ?? this.gifs, isAnimationEnabled: isAnimationEnabled ?? this.isAnimationEnabled);
  }
}
