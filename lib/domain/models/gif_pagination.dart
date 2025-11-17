import 'package:json_annotation/json_annotation.dart';

part 'gif_pagination.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class GifPagination {
  final int offset;
  final int totalCount;
  final int count;

  const GifPagination({
    required this.offset,
    required this.totalCount,
    required this.count,
  });

  factory GifPagination.fromJson(Map<String, dynamic> json) => _$GifPaginationFromJson(json);
}
