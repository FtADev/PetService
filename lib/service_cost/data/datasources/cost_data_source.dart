import 'package:pet_service/service_cost/data/api/get_cost_api.dart';
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
  final GetCostApi costApi;

  CostRemoteDataSourceImpl({required this.costApi});

  @override
  Future<CostModel> getCalculatedCost(
      {required bool isCatGrooming,
      required int catNights,
      required bool isDogGrooming,
      required int dogNights}) async {
    final remoteCost = await costApi.makeRequest(PetServiceCost(
      isCatGrooming: isCatGrooming,
      catNights: catNights,
      isDogGrooming: isDogGrooming,
      dogNights: dogNights,
    ));
    return CostModel.fromJson(remoteCost);
  }
}
