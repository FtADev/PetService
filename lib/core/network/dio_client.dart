import 'package:dio/dio.dart';
import 'package:pet_service/core/util/endpoints.dart';
import 'package:pet_service/di/injection_container.dart';

abstract class DioClient {
  // dio instance
  final Dio dio = getIt.get<Dio>();

  // injecting dio instance
  DioClient() {
    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
  }

  Future<Response> call(String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}
