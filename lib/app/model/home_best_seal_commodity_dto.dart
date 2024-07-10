import 'package:json_annotation/json_annotation.dart';

part 'home_best_seal_commodity_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class HomeBestSealCommodityDto {
  @JsonKey(name: "_id")
  final String id;
  final String title;
  final String cid;
  final int price;
  final String pic;
  final String subTitle;
  final String sPic;

  HomeBestSealCommodityDto(this.id, this.title, this.cid, this.price, this.pic,
      this.subTitle, this.sPic);

  factory HomeBestSealCommodityDto.fromJson(Map<String, dynamic> json) =>
      _$HomeBestSealCommodityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBestSealCommodityDtoToJson(this);
}
