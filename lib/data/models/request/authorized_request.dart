import 'package:json_annotation/json_annotation.dart';

part 'authorized_request.g.dart';

@JsonSerializable(createFactory: false)
class AuthorizedRequest {
  @JsonKey(name: 'api_key')
  final String apiKey;

  const AuthorizedRequest({required this.apiKey});

  Map<String, dynamic> toJson() => _$AuthorizedRequestToJson(this);
}
