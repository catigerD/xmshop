import 'package:dio/dio.dart';

const baseUrl = "https://miapp.itying.com";

final dio = Dio(BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
));
