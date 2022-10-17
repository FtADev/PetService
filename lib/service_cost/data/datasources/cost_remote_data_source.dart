import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pet_service/core/util/endpoints.dart';
import 'package:pet_service/core/network/dio_client.dart';

import '../../../../core/error/exceptions.dart';
import '../models/animal_model.dart';
import '../models/calculate_request_model.dart';
import '../models/calculate_result_model.dart';
import '../models/hotel_model.dart';
import '../models/services_model.dart';

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

    try {
    final Response response = await dioClient.post(
      Endpoints.baseUrl,
      data: reqModel.toJson(),
    );
    if (response.statusCode == 200) {
      return CostModel.fromJson(json.decode(response.data));
    } else {
      throw ServerException();
    } } catch(e) {
      print(e);
      throw ServerException();
    }
  }
}
