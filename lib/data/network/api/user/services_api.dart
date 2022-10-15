import 'package:dio/dio.dart';
import 'package:pet_service/data/model/calculate_request_model.dart';
import 'package:pet_service/data/network/api/constant/endpoints.dart';
import 'package:pet_service/data/network/dio_client.dart';

class ServicesApi {
  final DioClient dioClient;

  ServicesApi({required this.dioClient});

  Future<Response> calculateCost(CalculateRequestModel req) async {
    try {
      final Response response = await dioClient.post(
        Endpoints.baseUrl,
        data: req.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
