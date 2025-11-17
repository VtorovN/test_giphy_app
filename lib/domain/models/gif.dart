import 'package:json_annotation/json_annotation.dart';
import 'package:test_giphy_app/domain/models/gif_images.dart';
import 'package:test_giphy_app/domain/models/gif_user.dart';
import 'package:test_giphy_app/utils/serialization_utils.dart';

part 'gif.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Gif {
  final String id;
  final String? type;
  final String? title;

  final String? url;
  final String? bitlyUrl;
  final String? embedUrl;
  final String? slug;

  final String? source;
  final String? sourcePostUrl;
  final String? sourceTld;

  final GifUser? user;
  final String? username;

  @JsonKey(fromJson: SerializationUtils.parseDate)
  final DateTime? updateDatetime;
  @JsonKey(fromJson: SerializationUtils.parseDate)
  final DateTime? createDatetime;
  @JsonKey(fromJson: SerializationUtils.parseDate)
  final DateTime? importDatetime;
  @JsonKey(fromJson: SerializationUtils.parseDate)
  final DateTime? trendingDatetime;

  final GifImages? images;

  final String? altText;
  final String? rating;
  final bool? isLowContrast;

  const Gif({
    required this.id,
    this.type,
    this.title,
    this.url,
    this.bitlyUrl,
    this.embedUrl,
    this.slug,
    this.source,
    this.sourcePostUrl,
    this.sourceTld,
    this.user,
    this.username,
    this.updateDatetime,
    this.createDatetime,
    this.importDatetime,
    this.trendingDatetime,
    this.images,
    this.altText,
    this.rating,
    this.isLowContrast,
  });

  factory Gif.fromJson(Map<String, dynamic> json) => _$GifFromJson(json);
}
