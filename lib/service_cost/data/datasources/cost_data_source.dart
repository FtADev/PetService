import 'package:dio/dio.dart';
import 'package:pet_service/core/error/dio_exception.dart';
import 'package:pet_service/core/network/dio_client.dart';
import 'package:pet_service/core/util/endpoints.dart';

import '../../../../core/error/exceptions.dart';
import '../models/animal_model.dart';
import '../models/calculate_request_model.dart';
import '../models/calculate_result_model.dart';
import '../models/hotel_model.dart';
import '../models/services_model.dart';

abstract class CostDataSource {
  Future<CostModel> getCalculatedCost(
      {required bool isCatGrooming,
      required int catNights,
      required bool isDogGrooming,
      required int dogNights});
}

class CostRemoteDataSourceImpl implements CostDataSource {
  final DioClient dioClient;

  CostRemoteDataSourceImpl({
    required this.dioClient});

  @override
  Future<CostModel> getCalculatedCost(
      {required bool isCatGrooming,
      required int catNights,
      required bool isDogGrooming,
      required int dogNights}) async {
    RequestModel reqModel = RequestModel(
      cat: AnimalModel(
        services: ServicesModel(
          hotel: HotelModel(
            nights: catNights,
          ),
          grooming: isCatGrooming,
        ),
      ),
      dog: AnimalModel(
        services: ServicesModel(
          hotel: HotelModel(
            nights: dogNights,
          ),
          grooming: isDogGrooming,
        ),
      ),
    );
    try {
      final Response response = await dioClient.post(
        Endpoints.baseUrl,
        data: reqModel.toJson(),
      );
      if (response.statusCode == 200) {
        return CostModel.fromJson(response.data);
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

class CostLocalDataSourceImpl implements CostDataSource {
  @override
  Future<CostModel> getCalculatedCost(
      {required bool isCatGrooming,
      required int catNights,
      required bool isDogGrooming,
      required int dogNights}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return CostModel(totalPrice: 0);
    } catch (e) {
      throw CacheException();
    }
  }
}
