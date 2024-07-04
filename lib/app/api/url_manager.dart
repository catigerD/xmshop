import 'package:xmshop/app/api/dio_manager.dart';

String? handleUrl(String? origin) {
  if (origin == null) {
    return null;
  }
  return "$baseUrl/${origin.replaceAll("\\", "/")}";
}
