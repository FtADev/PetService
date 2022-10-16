import 'dart:convert';

import 'package:pet_service/data/model/calculate_result_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_COST = 'CACHED_COST';

class LocalDataSource {

  final SharedPreferences sharedPreferences;

  LocalDataSource({required this.sharedPreferences});


  Future<CalculateResultModel> getLastCost() {
    final jsonString = sharedPreferences.getString(CACHED_COST);
    if (jsonString != null) {
      return Future.value(CalculateResultModel.fromJson(json.decode(jsonString)));
    } else {
      throw Exception();
    }
  }

  Future<void> cacheCost(CalculateResultModel cost) {
    return sharedPreferences.setString(
      CACHED_COST,
      json.encode(cost.toJson()),
    );
  }
}
