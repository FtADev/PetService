import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pet_service/clean_arc/features/service_cost/data/models/animal_model.dart';
import 'package:pet_service/clean_arc/features/service_cost/data/models/calculate_request_model.dart';
import 'package:pet_service/clean_arc/features/service_cost/data/models/calculate_result_model.dart';
import 'package:pet_service/clean_arc/features/service_cost/data/models/hotel_model.dart';
import 'package:pet_service/clean_arc/features/service_cost/data/models/services_model.dart';
import 'package:pet_service/clean_arc/core/util/endpoints.dart';
import 'package:pet_service/clean_arc/core/dio_client.dart';

import '../../../../core/error/exceptions.dart';

abstract class CostRemoteDataSource {
  Future<CostModel> getCalculatedCost(
      {required bool isCatGrooming,
      required int catNights,
      required bool isDogGrooming,
      required int dogNights});
}

class CostRemoteDataSourceImpl implements CostRemoteDataSource {
  final DioClient dioClient;

  CostRemoteDataSourceImpl({required this.dioClient});

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

    final Response response = await dioClient.post(
      Endpoints.baseUrl,
      data: reqModel.toJson(),
    );
    if (response.statusCode == 200) {
      return CostModel.fromJson(json.decode(response.data));
    } else {
      throw ServerException();
    }
  }
}
