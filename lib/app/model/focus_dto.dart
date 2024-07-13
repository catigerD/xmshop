import 'package:json_annotation/json_annotation.dart';

part 'focus_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class FocusDto {
  @JsonKey(name: "_id")
  final String id;
  final String title;
  final String status;
  final String pic;
  final String url;
  final int position;

  const FocusDto({
    required this.id,
    required this.title,
    required this.status,
    required this.pic,
    required this.url,
    required this.position,
  });

  factory FocusDto.fromJson(Map<String, dynamic> json) =>
      _$FocusDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FocusDtoToJson(this);
}
