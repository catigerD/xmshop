import 'package:json_annotation/json_annotation.dart';

part 'home_focus_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class HomeFocusDto {
  @JsonKey(name: "_id")
  final String id;
  final String title;
  final String status;
  final String pic;
  final String url;
  final int position;

  const HomeFocusDto({
    required this.id,
    required this.title,
    required this.status,
    required this.pic,
    required this.url,
    required this.position,
  });

  factory HomeFocusDto.fromJson(Map<String, dynamic> json) =>
      _$HomeFocusDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeFocusDtoToJson(this);
}
