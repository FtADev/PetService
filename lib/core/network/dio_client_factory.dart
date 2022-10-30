import 'package:pet_service/core/network/dio_client.dart';
import 'package:pet_service/core/network/dio_client_get.dart';
import 'package:pet_service/core/network/dio_client_post.dart';

class DioClientFactory {
  static DioClient createDioClient({
    required String httpType,
    required String baseUrl,
    required int receiveTimeOut,
    required int connectionTimeOut,
  }) {
    switch (httpType) {
      case "get":
        return DioClientGet(
          baseUrl: baseUrl,
          receiveTimeout: receiveTimeOut,
          connectionTimeOut: connectionTimeOut,
        );
      case "post":
        return DioClientPost(
          baseUrl: baseUrl,
          receiveTimeout: receiveTimeOut,
          connectionTimeOut: connectionTimeOut,
        );
      default:
        return DioClientGet(
          baseUrl: baseUrl,
          receiveTimeout: receiveTimeOut,
          connectionTimeOut: connectionTimeOut,
        );
    }
  }
}
