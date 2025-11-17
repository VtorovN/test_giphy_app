import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_giphy_app/domain/interactors/gif_interactor.dart';
import 'package:test_giphy_app/domain/models/gif.dart';

import '../mocks.mocks.dart';

void main() {
  group(
    'GifInteractor',
    () {
      late MockGifRepository mockRepository;
      late GifInteractor interactor;

      setUp(() {
        mockRepository = MockGifRepository();
        interactor = GifInteractor(mockRepository);
      });

      test(
        'getGifList calls getTrendingGifs when searchQuery is null',
        () async {
          const page = 1;
          const pageSize = 20;

          when(mockRepository.getTrendingGifs(page: page, pageSize: pageSize)).thenAnswer((_) async => <Gif>[]);

          final result = await interactor.getGifList(page: page, pageSize: pageSize);

          expect(result, isA<List<Gif>>());

          verify(mockRepository.getTrendingGifs(page: page, pageSize: pageSize)).called(1);

          verifyNever(
            mockRepository.searchGifs(
              searchQuery: anyNamed('searchQuery'),
              page: anyNamed('page'),
              pageSize: anyNamed('pageSize'),
            ),
          );
        },
      );

      test(
        'getGifList calls searchGifs when searchQuery is not empty',
        () async {
          const page = 2;
          const pageSize = 10;
          const searchQuery = '123';

          when(
            mockRepository.searchGifs(searchQuery: searchQuery, page: page, pageSize: pageSize),
          ).thenAnswer((_) async => <Gif>[]);

          final result = await interactor.getGifList(page: page, pageSize: pageSize, searchQuery: searchQuery);

          expect(result, isA<List<Gif>>());
          verify(mockRepository.searchGifs(searchQuery: searchQuery, page: page, pageSize: pageSize)).called(1);
          verifyNever(
            mockRepository.getTrendingGifs(
              page: anyNamed('page'),
              pageSize: anyNamed('pageSize'),
            ),
          );
        },
      );

      test('getGifDetails delegates to repository', () async {
        const id = '1';
        const gif = Gif(id: id);

        when(mockRepository.getGifDetails(id)).thenAnswer((_) async => gif);

        final result = await interactor.getGifDetails(id);

        expect(result, same(gif));

        verify(mockRepository.getGifDetails(id)).called(1);
      });
    },
  );
}
