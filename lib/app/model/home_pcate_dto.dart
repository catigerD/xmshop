import 'package:json_annotation/json_annotation.dart';

part 'home_pcate_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class HomePcateDto {
  @JsonKey(name: "_id")
  final String id;
  final String title;
  final int status;
  final String pic;
  final String pid;
  final int sort;
  final int goProduct;
  final String productId;

  factory HomePcateDto.fromJson(Map<String, dynamic> json) =>
      _$HomePcateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomePcateDtoToJson(this);

  const HomePcateDto({
    required this.id,
    required this.title,
    required this.status,
    required this.pic,
    required this.pid,
    required this.sort,
    required this.goProduct,
    required this.productId,
  });
}
