import 'package:dio/dio.dart';
import 'package:pet_service/core/error/dio_exception.dart';
import 'package:pet_service/core/error/exceptions.dart';
import 'package:pet_service/core/network/api_request.dart';
import 'package:pet_service/core/network/dio_client_factory.dart';

abstract class API<T> {
  final APIRequest apiRequest;

  API({
    required this.apiRequest,
  });

  // Default Config
  String getBaseUrl() => "https://assignment.shly.me/";
  int getConnectionTimeout() => 15000;
  int getReceiveTimeout() => 15000;

  // Needed Methods
  String getUrl();
  String getHttpMethod();
  Map<String, dynamic> getHeader();

  Future makeRequest(T model) async {
    try {
      final Response response = await DioClientFactory.createDioClient(
        httpType: getHttpMethod(),
        baseUrl: getBaseUrl(),
        receiveTimeOut: getReceiveTimeout(),
        connectionTimeOut: getConnectionTimeout(),
      ).call(
        getUrl(),
        data: apiRequest.prepareRequest(model),
        options: Options(headers: getHeader()),
      );
      if (response.statusCode == 200) {
        // Check if response.data has error field,
        // if error status code == 0 return data,
        // else throw ServerException with given error message.
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
