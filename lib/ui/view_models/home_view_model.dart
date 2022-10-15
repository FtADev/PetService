import 'package:flutter/material.dart';
import 'package:pet_service/data/model/calculate_request_model.dart';
import 'package:pet_service/data/model/calculate_result_model.dart';
import 'package:pet_service/data/repository/service_repository.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends ChangeNotifier {
  final ServiceRepository serviceRepository;

  HomeViewModel(this.serviceRepository);

  int _cost = 0;

  int get cost => _cost;

  set cost(int value) {
    if (value != _cost) {
      _cost = value;
      notifyListeners();
    }
    print(_cost);
  }

  static HomeViewModel of(BuildContext context) =>
      Provider.of<HomeViewModel>(context, listen: false);

  Future calculateRequest(CalculateRequestModel req) async {
    CalculateResultModel? res =
        await serviceRepository.calculateCostRequest(req);
    (res.totalPrice != null) ? cost = res.totalPrice! : cost = 0;
  }
}
