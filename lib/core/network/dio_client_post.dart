import 'package:dio/dio.dart';

import 'dio_client.dart';

class DioClientPost extends DioClient {
  DioClientPost({
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
      final Response response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
