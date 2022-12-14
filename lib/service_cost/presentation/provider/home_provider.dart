import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pet_service/core/util/methods.dart';
import 'package:pet_service/di/injection_container.dart';
import 'package:pet_service/service_cost/domain/entities/pet_service_cost.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/cost.dart';
import '../../domain/usecases/get_calculated_cost.dart';

class HomeProvider extends ChangeNotifier {
  final GetCalculatedCostUseCase getCalculatedCostUseCase = getIt.get<GetCalculatedCostUseCase>();

  int _cost = 0;

  int get cost => _cost;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

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

  set errorMessage(String value) {
    if (value != _errorMessage) {
      _errorMessage = value;
      notifyListeners();
    }
  }

  Future calculateRequest({
    required bool isCatGrooming,
    required int catNights,
    required bool isDogGrooming,
    required int dogNights,
  }) async {
    errorMessage = "";
    cost = 0;
    if (checkIfSthSelected(
      isCatGrooming: isCatGrooming,
      catNights: catNights,
      isDogGrooming: isDogGrooming,
      dogNights: dogNights,
    )) {
      isLoading = true;
      Either<Failure, Cost> res = await getCalculatedCostUseCase(PetServiceCost(
        dogNights: dogNights,
        isDogGrooming: isDogGrooming,
        catNights: catNights,
        isCatGrooming: isCatGrooming,
      ));
      res.fold(
          (failure) => errorMessage = UtilsMethods.mapFailureToMessage(failure),
          (resCost) => resCost.totalPrice != null
              ? cost = resCost.totalPrice!
              : cost = 0);

      isLoading = false;
    } else {
      errorMessage = 'No item selected!';
    }
  }

  bool checkIfSthSelected({
    required bool isCatGrooming,
    required int catNights,
    required bool isDogGrooming,
    required int dogNights,
  }) {
    return (isCatGrooming || isDogGrooming || dogNights != 0 || catNights != 0);
  }
}
