import 'package:json_annotation/json_annotation.dart';
import 'package:test_giphy_app/data/models/response/meta.dart';

part 'giphy_response.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class GiphyResponse<T> {
  final T data;
  final Meta meta;

  const GiphyResponse({
    required this.data,
    required this.meta,
  });

  factory GiphyResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$GiphyResponseFromJson(json, fromJsonT);
}
