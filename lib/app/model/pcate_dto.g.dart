// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pcate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PCateDto _$PCateDtoFromJson(Map<String, dynamic> json) => PCateDto(
      id: json['_id'] as String,
      title: json['title'] as String,
      status: (json['status'] as num).toInt(),
      pic: json['pic'] as String,
      pid: json['pid'] as String,
      sort: json['sort'],
      goProduct: (json['go_product'] as num).toInt(),
      productId: json['product_id'] as String,
    );

Map<String, dynamic> _$PCateDtoToJson(PCateDto instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'status': instance.status,
      'pic': instance.pic,
      'pid': instance.pid,
      'sort': instance.sort,
      'go_product': instance.goProduct,
      'product_id': instance.productId,
    };
