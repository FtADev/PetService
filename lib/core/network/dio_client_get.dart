import 'package:dio/dio.dart';

import 'dio_client.dart';

class DioClientGet extends DioClient {
  DioClientGet({
    required super.baseUrl,
    required super.receiveTimeout,
    required super.connectionTimeOut,
  });

  @override
  Future<Response> call(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
