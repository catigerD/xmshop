import 'package:json_annotation/json_annotation.dart';

part 'home_plist_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class HomePListDto {
  @JsonKey(name: "_id")
  final String id;
  final String title;
  final String cid;
  final int price;
  final String pic;
  final String subTitle;
  final String sPic;

  HomePListDto(this.id, this.title, this.cid, this.price, this.pic,
      this.subTitle, this.sPic);

  factory HomePListDto.fromJson(Map<String, dynamic> json) =>
      _$HomePListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomePListDtoToJson(this);
}
