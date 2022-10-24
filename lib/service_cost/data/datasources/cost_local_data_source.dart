import 'package:pet_service/core/error/exceptions.dart';
import 'package:pet_service/service_cost/data/datasources/cost_data_source.dart';
import 'package:pet_service/service_cost/data/models/calculate_result_model.dart';

class CostLocalDataSourceImpl implements CostDataSource {
  @override
  Future<CostModel> getCalculatedCost(
      {required bool isCatGrooming,
        required int catNights,
        required bool isDogGrooming,
        required int dogNights}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return CostModel(totalPrice: -1);
    } catch (e) {
      throw CacheException();
    }
  }
}