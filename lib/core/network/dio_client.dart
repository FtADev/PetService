import 'package:dio/dio.dart';
import 'package:pet_service/di/injection_container.dart';

abstract class DioClient {
  // dio instance
  final Dio dio = getIt.get<Dio>();

  // dio config
  final int connectionTimeOut;
  final String baseUrl;
  final int receiveTimeout;

  DioClient({
    required this.baseUrl,
    required this.receiveTimeout,
    required this.connectionTimeOut,
  }) {
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = connectionTimeOut
      ..options.receiveTimeout = receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
  }

  Future<Response> call(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}
