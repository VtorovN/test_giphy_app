import 'package:injectable/injectable.dart';
import 'package:test_giphy_app/data/api/giphy_api.dart';
import 'package:test_giphy_app/data/models/request/authorized_pagination_request.dart';
import 'package:test_giphy_app/data/models/request/authorized_request.dart';
import 'package:test_giphy_app/data/models/request/giphy_search_request.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/domain/repositories/gif_repository.dart';
import 'package:test_giphy_app/service_locator/constants/injection_keys.dart';

@Injectable(as: GifRepository)
class GifRepositoryImpl implements GifRepository {
  final GiphyApi _giphyApi;

  // Giphy API doesn't seem to support authorization via headers,
  // so only option is to pass the API key with each request.
  final String _apiKey;

  const GifRepositoryImpl(
    this._giphyApi,
    @Named(InjectionKeys.apiKey) this._apiKey,
  );

  @override
  Future<List<Gif>> getTrendingGifs({
    required int page,
    required int pageSize,
  }) async {
    final offset = _calculateOffset(page, pageSize);

    final result = await _giphyApi.getTrendingGifs(
      AuthorizedPaginationRequest(
        apiKey: _apiKey,
        offset: offset,
        limit: pageSize,
      ),
    );

    return result.data;
  }

  @override
  Future<List<Gif>> searchGifs({
    required String searchQuery,
    required int page,
    required int pageSize,
  }) async {
    final offset = _calculateOffset(page, pageSize);

    final result = await _giphyApi.searchGifs(
      GiphySearchRequest(
        apiKey: _apiKey,
        searchQuery: searchQuery,
        offset: offset,
        limit: pageSize,
      ),
    );

    return result.data;
  }

  @override
  Future<Gif> getGifDetails(String gifId) async {
    final result = await _giphyApi.getGifById(
      gifId,
      AuthorizedRequest(apiKey: _apiKey),
    );

    return result.data;
  }

  int _calculateOffset(int page, int pageSize) => (page - 1) * pageSize;
}
