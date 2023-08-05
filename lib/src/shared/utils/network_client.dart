import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkClient {
  NetworkClient._();
  late Dio dio;
  static NetworkClient instance = NetworkClient._();
  void setup() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.unsplash.com'));
    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
}
