import 'package:json_annotation/json_annotation.dart';
import 'package:test_giphy_app/domain/models/gif_image_format.dart';

part 'gif_images.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class GifImages {
  final GifImageFormat? fixedHeight;
  final GifImageFormat? fixedHeightStill;
  final GifImageFormat? fixedHeightDownsampled;
  final GifImageFormat? fixedWidth;
  final GifImageFormat? fixedWidthStill;
  final GifImageFormat? fixedWidthDownsampled;
  final GifImageFormat? fixedHeightSmall;
  final GifImageFormat? fixedHeightSmallStill;
  final GifImageFormat? fixedWidthSmall;
  final GifImageFormat? fixedWidthSmallStill;
  final GifImageFormat? downsized;
  final GifImageFormat? downsizedStill;
  final GifImageFormat? downsizedLarge;
  final GifImageFormat? downsizedMedium;
  final GifImageFormat? original;
  final GifImageFormat? originalStill;
  final GifImageFormat? preview;
  final GifImageFormat? previewGif;

  const GifImages({
    required this.fixedHeight,
    required this.fixedHeightStill,
    required this.fixedHeightDownsampled,
    required this.fixedWidth,
    required this.fixedWidthStill,
    required this.fixedWidthDownsampled,
    required this.fixedHeightSmall,
    required this.fixedHeightSmallStill,
    required this.fixedWidthSmall,
    required this.fixedWidthSmallStill,
    required this.downsized,
    required this.downsizedStill,
    required this.downsizedLarge,
    required this.downsizedMedium,
    required this.original,
    required this.originalStill,
    required this.preview,
    required this.previewGif,
  });

  factory GifImages.fromJson(Map<String, dynamic> json) => _$GifImagesFromJson(json);
}
