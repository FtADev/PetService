import 'package:dio/dio.dart';
import 'package:pet_service/data/local/local_data_source.dart';
import 'package:pet_service/data/model/calculate_request_model.dart';
import 'package:pet_service/data/model/calculate_result_model.dart';
import 'package:pet_service/data/network/api/service/network_info.dart';
import 'package:pet_service/data/network/api/service/services_api.dart';
import 'package:pet_service/data/network/dio_exception.dart';

class ServiceRepository {
  final ServicesApi serviceApi;
  final NetworkInfo networkInfo;
  final LocalDataSource localDataSource;

  ServiceRepository({required this.serviceApi, required this.networkInfo, required this.localDataSource});

  Future<CalculateResultModel> calculateCostRequest(
      CalculateRequestModel req) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await serviceApi.calculateCost(req);
        localDataSource.cacheCost(CalculateResultModel.fromJson(response.data));
        return CalculateResultModel.fromJson(response.data);
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();
        throw errorMessage;
      }
    } else {
      try {
        final localCost = await localDataSource.getLastCost();
        return localCost;
      } on Exception catch (e) {
        final errorMessage = e.toString();
        throw errorMessage;
      }
    }
  }
}
