import 'package:dio/dio.dart';
import 'package:xmshop/app/model/response_dto.dart';
import 'package:xmshop/util/LogManager.dart';

final dio = Dio();

class HttpClient {
  static const _baseUrl = "https://miapp.itying.com";

  static final Dio _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      responseType: ResponseType.json));

  static String handleUrl(String origin) {
    if (origin.isEmpty) {
      return origin;
    }
    return "$_baseUrl/${origin.replaceAll("\\", "/")}";
  }

  static Future<T?> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      required T Function(dynamic json) fromJsonT}) async {
    T? result;
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      result = ResponseDto<T>.fromJson(response.data, fromJsonT).result;
    } catch (e) {
      LogManager.e(e);
      result = null;
    }
    return result;
  }

  static Future<List<T>?> getList<T>(String path,
      {Map<String, dynamic>? queryParameters,
      required T Function(Map<String, dynamic> json) fromJsonT}) async {
    List<T>? result;
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      result = ResponseDto<List<T>>.fromJson(response.data, (json) {
        return (json as List).map((e) => fromJsonT(e)).toList();
      }).result;
    } catch (e) {
      LogManager.e(e);
      result = null;
    }

    return result;
  }
}
