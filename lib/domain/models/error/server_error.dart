import 'package:json_annotation/json_annotation.dart';

part 'server_error.g.dart';

@JsonSerializable(createToJson: false)
class ServerError implements Exception {
  final String message;
  final int? code;

  const ServerError({
    required this.message,
    required this.code,
  });

  factory ServerError.fromJson(Map<String, dynamic> json, int? code) {
    json['code'] = code;

    return _$ServerErrorFromJson(json);
  }
}
