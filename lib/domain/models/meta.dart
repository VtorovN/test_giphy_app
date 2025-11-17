import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Meta {
  final String msg;
  final int status;
  final String responseId;

  const Meta({
    required this.msg,
    required this.status,
    required this.responseId,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
