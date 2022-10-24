import 'package:pet_service/core/network/api.dart';
import 'package:pet_service/service_cost/domain/entities/pet_service_cost.dart';

import '../models/calculate_result_model.dart';

abstract class CostDataSource {
  Future<CostModel> getCalculatedCost(
      {required bool isCatGrooming,
      required int catNights,
      required bool isDogGrooming,
      required int dogNights});
}

class CostRemoteDataSourceImpl implements CostDataSource {
  final API api;

  CostRemoteDataSourceImpl({required this.api});

  @override
  Future<CostModel> getCalculatedCost(
      {required bool isCatGrooming,
      required int catNights,
      required bool isDogGrooming,
      required int dogNights}) async {
    final remoteCost = await api.makeRequest(PetServiceCost(
      isCatGrooming: isCatGrooming,
      catNights: catNights,
      isDogGrooming: isDogGrooming,
      dogNights: dogNights,
    ));
    return CostModel.fromJson(remoteCost);
  }
}
