import 'package:json_annotation/json_annotation.dart';

part 'home_focus_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeFocusDto {
  @JsonKey(name: "_id")
  String id = "";
  String title = "";
  String status = "";
  String pic = "";
  String url = "";
  int position = 0;

  HomeFocusDto();

  factory HomeFocusDto.fromJson(Map<String, dynamic> json) =>
      _$HomeFocusDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeFocusDtoToJson(this);
}
