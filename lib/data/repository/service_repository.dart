import 'package:dio/dio.dart';
import 'package:pet_service/data/model/calculate_request_model.dart';
import 'package:pet_service/data/model/calculate_result_model.dart';
import 'package:pet_service/data/network/api/service/services_api.dart';
import 'package:pet_service/data/network/dio_exception.dart';

class ServiceRepository {
  final ServicesApi serviceApi;

  ServiceRepository(this.serviceApi);

  Future<CalculateResultModel> calculateCostRequest(CalculateRequestModel req) async {
    try {
      final response = await serviceApi.calculateCost(req);
      return CalculateResultModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
