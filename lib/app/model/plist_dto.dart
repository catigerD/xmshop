import 'package:json_annotation/json_annotation.dart';

part 'plist_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PListDto {
  @JsonKey(name: "_id")
  final String id;
  final String title;
  final String cid;
  final int price;
  final String pic;
  final String subTitle;
  final String sPic;

  PListDto(this.id, this.title, this.cid, this.price, this.pic,
      this.subTitle, this.sPic);

  factory PListDto.fromJson(Map<String, dynamic> json) =>
      _$PListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PListDtoToJson(this);
}
