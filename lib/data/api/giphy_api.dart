import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_giphy_app/data/models/request/authorized_pagination_request.dart';
import 'package:test_giphy_app/data/models/request/authorized_request.dart';
import 'package:test_giphy_app/data/models/request/giphy_search_request.dart';
import 'package:test_giphy_app/data/models/response/gif_list_response.dart';
import 'package:test_giphy_app/data/models/response/giphy_response.dart';
import 'package:test_giphy_app/domain/models/gif.dart';

part 'giphy_api.g.dart';

@lazySingleton
@RestApi()
abstract class GiphyApi {
  @factoryMethod
  factory GiphyApi(Dio dio) = _GiphyApi;

  @GET('/gifs/trending')
  Future<GifListResponse> getTrendingGifs(
    @Queries(encoded: true) AuthorizedPaginationRequest request,
  );

  @GET('/gifs/search')
  Future<GifListResponse> searchGifs(
    @Queries(encoded: true) GiphySearchRequest request,
  );

  @GET('/gifs/{id}')
  Future<GiphyResponse<Gif>> getGifById(
    @Path() String id,
    @Queries(encoded: true) AuthorizedRequest request,
  );
}
