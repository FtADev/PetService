import 'package:pet_service/service_cost/data/api/get_cost_api.dart';
import 'package:pet_service/service_cost/domain/entities/pet_service_cost.dart';

import '../models/calculate_result_model.dart';

abstract class CostDataSource {
  Future<CostModel> getCalculatedCost({required PetServiceCost petServiceCost});
}

class CostRemoteDataSourceImpl implements CostDataSource {
  final GetCostApi costApi;

  CostRemoteDataSourceImpl({required this.costApi});

  @override
  Future<CostModel> getCalculatedCost(
      {required PetServiceCost petServiceCost}) async {
    final remoteCost = await costApi.makeRequest(petServiceCost);
    return CostModel.fromJson(remoteCost);
  }
}
