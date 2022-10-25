import 'package:pet_service/core/network/dio_client.dart';
import 'package:pet_service/core/network/dio_client_get.dart';
import 'package:pet_service/core/network/dio_client_post.dart';

class DioClientFactory {
  static DioClient createDioClient(String httpType) {
    switch (httpType) {
      case "get":
        return DioClientGet();
      case "post":
        return DioClientPost();
      default:
        return DioClientGet();
    }
  }
}
