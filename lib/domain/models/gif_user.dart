import 'package:json_annotation/json_annotation.dart';

part 'gif_user.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class GifUser {
  final String? avatarUrl;
  final String? bannerUrl;
  final String? profileUrl;
  final String? username;
  final String? displayName;

  const GifUser({
    required this.avatarUrl,
    required this.bannerUrl,
    required this.profileUrl,
    required this.username,
    required this.displayName,
  });

  factory GifUser.fromJson(Map<String, dynamic> json) => _$GifUserFromJson(json);
}
