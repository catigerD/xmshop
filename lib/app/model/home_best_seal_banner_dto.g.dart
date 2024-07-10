// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_best_seal_banner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBestSealBannerDto _$HomeBestSealBannerDtoFromJson(
        Map<String, dynamic> json) =>
    HomeBestSealBannerDto(
      id: json['_id'] as String,
      title: json['title'] as String,
      status: json['status'] as String,
      pic: json['pic'] as String,
      url: json['url'] as String,
      position: (json['position'] as num).toInt(),
    );

Map<String, dynamic> _$HomeBestSealBannerDtoToJson(
        HomeBestSealBannerDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'status': instance.status,
      'pic': instance.pic,
      'url': instance.url,
      'position': instance.position,
    };
