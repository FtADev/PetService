import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/calculate_result_model.dart';

const CACHED_COST = 'CACHED_COST';

class LocalDataSource {

  final SharedPreferences sharedPreferences;

  LocalDataSource({required this.sharedPreferences});


  Future<CostModel> getLastCost() {
    final jsonString = sharedPreferences.getString(CACHED_COST);
    if (jsonString != null) {
      return Future.value(CostModel.fromJson(json.decode(jsonString)));
    } else {
      throw Exception();
    }
  }

  Future<void> cacheCost(CostModel cost) {
    return sharedPreferences.setString(
      CACHED_COST,
      json.encode(cost.toJson()),
    );
  }
}
