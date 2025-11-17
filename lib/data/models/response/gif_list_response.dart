import 'package:json_annotation/json_annotation.dart';
import 'package:test_giphy_app/data/models/response/giphy_response.dart';
import 'package:test_giphy_app/data/models/response/meta.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/domain/models/gif_pagination.dart';

part 'gif_list_response.g.dart';

@JsonSerializable(createToJson: false)
class GifListResponse extends GiphyResponse<List<Gif>> {
  final GifPagination pagination;

  const GifListResponse({
    required super.data,
    required super.meta,
    required this.pagination,
  });

  factory GifListResponse.fromJson(Map<String, dynamic> json) => _$GifListResponseFromJson(json);
}
