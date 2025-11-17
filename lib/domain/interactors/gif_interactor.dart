import 'package:injectable/injectable.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/domain/repositories/gif_repository.dart';

@lazySingleton
class GifInteractor {
  final GifRepository _gifRepository;

  const GifInteractor(this._gifRepository);

  Future<List<Gif>> getGifList({
    required int page,
    required int pageSize,
    String? searchQuery,
  }) {
    if (searchQuery == null || searchQuery.trim().isEmpty) {
      return _gifRepository.getTrendingGifs(
        page: page,
        pageSize: pageSize,
      );
    }

    return _gifRepository.searchGifs(
      searchQuery: searchQuery,
      page: page,
      pageSize: pageSize,
    );
  }

  Future<Gif> getGifDetails(String gifId) => _gifRepository.getGifDetails(gifId);
}
