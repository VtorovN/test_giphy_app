import 'package:test_giphy_app/domain/models/gif.dart';

abstract class GifRepository {
  Future<List<Gif>> getTrendingGifs({
    required int page,
    required int pageSize,
  });

  Future<List<Gif>> searchGifs({
    required String searchQuery,
    required int page,
    required int pageSize,
  });

  Future<Gif> getGifDetails(String gifId);
}
