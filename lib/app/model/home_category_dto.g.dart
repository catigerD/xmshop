// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCategoryDto _$HomeCategoryDtoFromJson(Map<String, dynamic> json) =>
    HomeCategoryDto()
      ..id = json['_id'] as String
      ..title = json['title'] as String
      ..status = (json['status'] as num).toInt()
      ..pic = json['pic'] as String
      ..pid = json['pid'] as String
      ..sort = (json['sort'] as num).toInt()
      ..isBest = (json['is_best'] as num).toInt()
      ..goProduct = (json['go_product'] as num).toInt()
      ..productId = json['product_id'] as String;

Map<String, dynamic> _$HomeCategoryDtoToJson(HomeCategoryDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'status': instance.status,
      'pic': instance.pic,
      'pid': instance.pid,
      'sort': instance.sort,
      'is_best': instance.isBest,
      'go_product': instance.goProduct,
      'product_id': instance.productId,
    };
