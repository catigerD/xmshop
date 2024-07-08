import 'package:xmshop/app/api/dio_manager.dart';

String handleUrl(String origin) {
  if (origin.isEmpty) {
    return origin;
  }
  return "$baseUrl/${origin.replaceAll("\\", "/")}";
}
