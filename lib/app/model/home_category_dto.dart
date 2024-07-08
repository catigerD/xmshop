import 'package:json_annotation/json_annotation.dart';

part 'home_category_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class HomeCategoryDto {
  @JsonKey(name: "_id")
  String id = "";
  String title = "";
  int status = 0;
  String pic = "";
  String pid = "";
  int sort = 0;
  int isBest = 0;
  int goProduct = 0;
  String productId = "";

  HomeCategoryDto();

  factory HomeCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCategoryDtoToJson(this);
}
