import 'package:test_giphy_app/domain/models/gif.dart';

sealed class GifDetailsState {
  // ID is in state to easily reload gif details on error
  final String gifId;

  const GifDetailsState({
    required this.gifId,
  });
}

final class GifDetailsInitial extends GifDetailsState {
  const GifDetailsInitial({
    required super.gifId,
  });
}

final class GifDetailsLoading extends GifDetailsState {
  const GifDetailsLoading({
    required super.gifId,
  });
}

final class GifDetailsError extends GifDetailsState {
  final Object error;

  const GifDetailsError({
    required super.gifId,
    required this.error,
  });
}

final class GifDetailsLoaded extends GifDetailsState {
  final Gif gif;

  GifDetailsLoaded({
    required this.gif,
  }) : super(gifId: gif.id);
}
