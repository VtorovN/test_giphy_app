import 'package:json_annotation/json_annotation.dart';
import 'package:test_giphy_app/data/models/request/authorized_request.dart';

part 'authorized_pagination_request.g.dart';

@JsonSerializable(createFactory: false)
class AuthorizedPaginationRequest extends AuthorizedRequest {
  final int? offset;
  final int? limit;

  const AuthorizedPaginationRequest({
    required super.apiKey,
    this.offset,
    this.limit,
  });

  @override
  Map<String, dynamic> toJson() => _$AuthorizedPaginationRequestToJson(this);
}
