// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_focus_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeFocusDto _$HomeFocusDtoFromJson(Map<String, dynamic> json) => HomeFocusDto()
  ..id = json['_id'] as String?
  ..title = json['title'] as String?
  ..status = json['status'] as String?
  ..pic = json['pic'] as String?
  ..url = json['url'] as String?
  ..position = (json['position'] as num?)?.toInt();

Map<String, dynamic> _$HomeFocusDtoToJson(HomeFocusDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'status': instance.status,
      'pic': instance.pic,
      'url': instance.url,
      'position': instance.position,
    };
