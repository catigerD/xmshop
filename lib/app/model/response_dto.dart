import 'package:json_annotation/json_annotation.dart';

part 'response_dto.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseDto<Result> {
  final String? message;
  final Result? result;

  ResponseDto(this.message, this.result);

  factory ResponseDto.fromJson(Map<String, dynamic> json,
          Result Function(dynamic json) fromJsonResult) =>
      _$ResponseDtoFromJson(json, fromJsonResult);

  Map<String, dynamic> toJson(Object? Function(Result value) toJsonResult) =>
      _$ResponseDtoToJson(this, toJsonResult);
}
