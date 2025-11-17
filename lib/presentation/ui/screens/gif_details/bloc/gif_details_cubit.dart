import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_giphy_app/domain/interactors/gif_interactor.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/presentation/ui/screens/gif_details/bloc/gif_details_state.dart';

@injectable
class GifDetailsCubit extends Cubit<GifDetailsState> {
  final GifInteractor _interactor;

  GifDetailsCubit(
    this._interactor,
    @factoryParam String? gifId,
    @factoryParam Gif? gif,
  ) : assert(
        gifId != null || gif != null,
        'Either gifId or gif must be provided',
      ),
      super(
        gif != null ? GifDetailsLoaded(gif: gif) : GifDetailsInitial(gifId: gifId!),
      ) {
    if (gif == null && gifId != null) {
      loadGifDetails();
    }
  }

  Future<void> loadGifDetails() async {
    emit(GifDetailsLoading(gifId: state.gifId));

    try {
      final gifDetails = await _interactor.getGifDetails(state.gifId);

      emit(GifDetailsLoaded(gif: gifDetails));
    } catch (e) {
      final errorObject = switch (e) {
        DioException(:Object error) => error,
        _ => e,
      };

      emit(
        GifDetailsError(
          error: errorObject,
          gifId: state.gifId,
        ),
      );
    }
  }
}
