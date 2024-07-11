import 'package:json_annotation/json_annotation.dart';

part 'home_best_cate_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class HomeBestCateDto {
  @JsonKey(name: "_id")
  final String id;

  final String title;

  final int status;
  final String pic;
  final String pid;
  final int sort;
  final int isBest;

  final int goProduct;

  final String productId;

  factory HomeBestCateDto.fromJson(Map<String, dynamic> json) =>
      _$HomeBestCateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBestCateDtoToJson(this);

  const HomeBestCateDto({
    required this.id,
    required this.title,
    required this.status,
    required this.pic,
    required this.pid,
    required this.sort,
    required this.isBest,
    required this.goProduct,
    required this.productId,
  });
}
