// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_best_seal_commodity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBestSealCommodityDto _$HomeBestSealCommodityDtoFromJson(
        Map<String, dynamic> json) =>
    HomeBestSealCommodityDto(
      json['_id'] as String,
      json['title'] as String,
      json['cid'] as String,
      (json['price'] as num).toInt(),
      json['pic'] as String,
      json['sub_title'] as String,
      json['s_pic'] as String,
    );

Map<String, dynamic> _$HomeBestSealCommodityDtoToJson(
        HomeBestSealCommodityDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'cid': instance.cid,
      'price': instance.price,
      'pic': instance.pic,
      'sub_title': instance.subTitle,
      's_pic': instance.sPic,
    };
