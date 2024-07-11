// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_plist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePListDto _$HomePListDtoFromJson(Map<String, dynamic> json) => HomePListDto(
      json['_id'] as String,
      json['title'] as String,
      json['cid'] as String,
      (json['price'] as num).toInt(),
      json['pic'] as String,
      json['sub_title'] as String,
      json['s_pic'] as String,
    );

Map<String, dynamic> _$HomePListDtoToJson(HomePListDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'cid': instance.cid,
      'price': instance.price,
      'pic': instance.pic,
      'sub_title': instance.subTitle,
      's_pic': instance.sPic,
    };
