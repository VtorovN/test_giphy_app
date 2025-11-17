import 'package:json_annotation/json_annotation.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/domain/models/gif_pagination.dart';
import 'package:test_giphy_app/domain/models/meta.dart';

part 'gif_list.g.dart';

@JsonSerializable(createToJson: false)
class GifList {
  final List<Gif> data;
  final GifPagination pagination;
  final Meta meta;

  const GifList({
    required this.data,
    required this.pagination,
    required this.meta,
  });

  factory GifList.fromJson(Map<String, dynamic> json) => _$GifListFromJson(json);
}
