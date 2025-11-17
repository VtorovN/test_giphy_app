import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/presentation/ui/screens/gif_details/bloc/gif_details_cubit.dart';
import 'package:test_giphy_app/presentation/ui/screens/gif_details/bloc/gif_details_state.dart';

import '../mocks.mocks.dart';

void main() {
  group('GifDetailsCubit', () {
    late MockGifInteractor mockInteractor;

    setUp(() {
      mockInteractor = MockGifInteractor();
    });

    test(
      'Initial state when gif provided is GifDetailsLoaded',
      () {
        const gif = Gif(id: '1');
        final cubit = GifDetailsCubit(mockInteractor, null, gif);

        expect(cubit.state, isA<GifDetailsLoaded>());

        expect((cubit.state as GifDetailsLoaded).gif, same(gif));
      },
    );

    test(
      'loadGifDetails emits loading, then loaded',
      () async {
        const id = '1';
        const gif = Gif(id: id);

        when(mockInteractor.getGifDetails(id)).thenAnswer((_) async => gif);

        final cubit = GifDetailsCubit(mockInteractor, id, null);

        final states = <GifDetailsState>[];
        final sub = cubit.stream.listen(states.add);

        await cubit.loadGifDetails();

        await Future.delayed(Duration.zero);

        expect(states.length, greaterThanOrEqualTo(2));

        expect(states.first, isA<GifDetailsLoading>());
        expect(states.last, isA<GifDetailsLoaded>());

        expect((states.last as GifDetailsLoaded).gif.id, equals(id));

        await sub.cancel();
      },
    );

    test(
      'loadGifDetails emits error on exception',
      () async {
        const id = '2';

        when(mockInteractor.getGifDetails(id)).thenThrow(Exception('fail'));

        final cubit = GifDetailsCubit(mockInteractor, id, null);

        final states = <GifDetailsState>[];
        final sub = cubit.stream.listen(states.add);

        await cubit.loadGifDetails();

        await Future.delayed(Duration.zero);

        expect(states.last, isA<GifDetailsError>());

        await sub.cancel();
      },
    );
  });
}
