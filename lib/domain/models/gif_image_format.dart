import 'package:json_annotation/json_annotation.dart';
import 'package:test_giphy_app/utils/serialization_utils.dart';

part 'gif_image_format.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class GifImageFormat {
  final String? url;
  @JsonKey(fromJson: int.parse)
  final int width;
  @JsonKey(fromJson: int.parse)
  final int height;
  @JsonKey(fromJson: SerializationUtils.parseInt)
  final int? size;
  final String? mp4;
  @JsonKey(fromJson: SerializationUtils.parseInt)
  final int? mp4Size;
  final String? webp;
  @JsonKey(fromJson: SerializationUtils.parseInt)
  final int? webpSize;
  @JsonKey(fromJson: SerializationUtils.parseInt)
  final int? frames;

  const GifImageFormat({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
    required this.mp4,
    required this.mp4Size,
    required this.webp,
    required this.webpSize,
    required this.frames,
  });

  factory GifImageFormat.fromJson(Map<String, dynamic> json) => _$GifImageFormatFromJson(json);
}
