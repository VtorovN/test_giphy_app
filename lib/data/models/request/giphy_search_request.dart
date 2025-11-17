import 'package:json_annotation/json_annotation.dart';
import 'package:test_giphy_app/data/models/request/authorized_pagination_request.dart';

part 'giphy_search_request.g.dart';

@JsonSerializable(createFactory: false)
class GiphySearchRequest extends AuthorizedPaginationRequest {
  @JsonKey(name: 'q')
  final String searchQuery;

  const GiphySearchRequest({
    required super.apiKey,
    super.offset,
    super.limit,
    required this.searchQuery,
  });

  @override
  Map<String, dynamic> toJson() => _$GiphySearchRequestToJson(this);
}
