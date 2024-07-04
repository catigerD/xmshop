import 'package:json_annotation/json_annotation.dart';

part 'response_dto.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class ResponseDto<T> {
  String? message;
  T? result;

  ResponseDto();

  factory ResponseDto.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$ResponseDtoFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ResponseDtoToJson(this, toJsonT);
}
