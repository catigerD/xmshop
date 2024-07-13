import 'package:json_annotation/json_annotation.dart';

part 'pcate_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PCateDto {
  @JsonKey(name: "_id")
  final String id;
  final String title;
  final int status;
  final String pic;
  final String pid;
  final int sort;
  final int goProduct;
  final String productId;

  factory PCateDto.fromJson(Map<String, dynamic> json) =>
      _$PCateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PCateDtoToJson(this);

  const PCateDto({
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
