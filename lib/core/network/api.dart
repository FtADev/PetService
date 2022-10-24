import 'package:dio/dio.dart';
import 'package:pet_service/core/error/dio_exception.dart';
import 'package:pet_service/core/error/exceptions.dart';
import 'package:pet_service/core/network/api_request.dart';
import 'package:pet_service/core/network/dio_client.dart';

abstract class API<T> {
  final APIRequest apiRequest;
  final DioClient dioClient;

  API({
    required this.dioClient,
    required this.apiRequest,
  });

  String getUrl();

  String getHttpMethod();

  Map<String, dynamic> getHeader();

  Future makeRequest(T model) async {
    try {
      final Response response = (getHttpMethod() == "get"
          ? await dioClient.get(
              getUrl(),
              queryParameters: apiRequest.prepareRequestToJson(model),
              options: Options(headers: getHeader()),
            )
          : await dioClient.post(
              getUrl(),
              data: apiRequest.prepareRequestToJson(model),
              options: Options(headers: getHeader()),
            ));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw ServerException(message: "Incorrect Request");
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw ServerException(message: errorMessage);
    } catch (e) {
      throw ServerException(
          message: "Sorry, Server could not response right now!");
    }
  }
}
