// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDto<Result> _$ResponseDtoFromJson<Result>(
  Map<String, dynamic> json,
  Result Function(Object? json) fromJsonResult,
) =>
    ResponseDto<Result>(
      json['message'] as String?,
      _$nullableGenericFromJson(json['result'], fromJsonResult),
    );

Map<String, dynamic> _$ResponseDtoToJson<Result>(
  ResponseDto<Result> instance,
  Object? Function(Result value) toJsonResult,
) =>
    <String, dynamic>{
      'message': instance.message,
      'result': _$nullableGenericToJson(instance.result, toJsonResult),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
