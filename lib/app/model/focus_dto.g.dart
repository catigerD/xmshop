// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusDto _$FocusDtoFromJson(Map<String, dynamic> json) => FocusDto(
      id: json['_id'] as String,
      title: json['title'] as String,
      status: json['status'] as String,
      pic: json['pic'] as String,
      url: json['url'] as String,
      position: (json['position'] as num).toInt(),
    );

Map<String, dynamic> _$FocusDtoToJson(FocusDto instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'status': instance.status,
      'pic': instance.pic,
      'url': instance.url,
      'position': instance.position,
    };
