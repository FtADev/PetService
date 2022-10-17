import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../clean_arc/features/service_cost/data/models/calculate_request_model.dart';
import '../../clean_arc/features/service_cost/data/models/calculate_result_model.dart';
import '../../clean_arc/features/service_cost/domain/repositories/service_repository.dart';

class HomeViewModel extends ChangeNotifier {
  // final ServiceRepository serviceRepository;

  // HomeViewModel(this.serviceRepository);

  int _cost = 0;

  int get cost => _cost;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set cost(int value) {
    if (value != _cost) {
      _cost = value;
      notifyListeners();
    }
  }

  set isLoading(bool value) {
    if (value != _isLoading) {
      _isLoading = value;
      notifyListeners();
    }
  }

  static HomeViewModel of(BuildContext context) =>
      Provider.of<HomeViewModel>(context, listen: false);

  Future calculateRequest({
    required bool isCatGrooming,
    required int catNights,
    required bool isDogGrooming,
    required int dogNights,
  }) async {
    // isLoading = true;
    // var res =
    //     await serviceRepository.getCalculatedConst(
    //       dogNights: dogNights,
    //       isDogGrooming: isDogGrooming,
    //       catNights: catNights,
    //       isCatGrooming: isCatGrooming,);
    // (res.totalPrice != null) ? cost = res.totalPrice! : cost = 0;
    // isLoading = false;
  }
}
