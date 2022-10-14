import 'package:dio/dio.dart';
import 'package:pet_service/repository/remote/urls.dart';

class DioClient {
  static BaseOptions options = BaseOptions(
    baseUrl: URLs.BASE_URL,
    connectTimeout: 60000,
    receiveTimeout: 15000,
    responseType: ResponseType.json,
    followRedirects: false,
    receiveDataWhenStatusError: true,
  );

  static final DioClient _dioClient = DioClient._internal();
  final Dio _dio = Dio(options);

  Dio get dio => _dio;

  factory DioClient() {
    return _dioClient;
  }

  DioClient._internal() {
    dio.interceptors;
    _dio.interceptors.add(LogInterceptor(
      responseBody: true,
      request: false,
      requestHeader: true,
      responseHeader: true,
      requestBody: false,
      error: true,
    ));
  }
}

