import 'package:json_annotation/json_annotation.dart';

part 'home_best_seal_banner_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeBestSealBannerDto {
  @JsonKey(name: "_id")
  final String id;
  final String title;
  final String status;
  final String pic;
  final String url;
  final int position;

  const HomeBestSealBannerDto({
    required this.id,
    required this.title,
    required this.status,
    required this.pic,
    required this.url,
    required this.position,
  });

  factory HomeBestSealBannerDto.fromJson(Map<String, dynamic> json) =>
      _$HomeBestSealBannerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBestSealBannerDtoToJson(this);
}
