import 'package:json_annotation/json_annotation.dart';

part 'best_cate_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class BestCateDto {
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

  factory BestCateDto.fromJson(Map<String, dynamic> json) =>
      _$BestCateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BestCateDtoToJson(this);

  const BestCateDto({
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
