import 'package:pet_service/core/error/exceptions.dart';
import 'package:pet_service/service_cost/data/datasources/cost_data_source.dart';
import 'package:pet_service/service_cost/data/models/calculate_result_model.dart';
import 'package:pet_service/service_cost/domain/entities/pet_service_cost.dart';

class CostLocalDataSourceImpl implements CostDataSource {
  @override
  Future<CostModel> getCalculatedCost(
      {required PetServiceCost petServiceCost}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return CostModel(totalPrice: -1);
    } catch (e) {
      throw CacheException();
    }
  }
}