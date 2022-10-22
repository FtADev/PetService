import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pet_service/di/injection_container.dart';
import 'package:provider/provider.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/cost.dart';
import '../../../domain/usecases/get_calculated_cost.dart';

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

  static HomeProvider of(BuildContext context) =>
      Provider.of<HomeProvider>(context, listen: false);

  Future calculateRequest({
    required bool isCatGrooming,
    required int catNights,
    required bool isDogGrooming,
    required int dogNights,
  }) async {
    if (checkIfSthSelected(
      isCatGrooming: isCatGrooming,
      catNights: catNights,
      isDogGrooming: isDogGrooming,
      dogNights: dogNights,
    )) {
      errorMessage = "";
      cost = 0;
      isLoading = true;
      Either<Failure, Cost> res = await getCalculatedCostUseCase(Params(
        dogNights: dogNights,
        isDogGrooming: isDogGrooming,
        catNights: catNights,
        isCatGrooming: isCatGrooming,
      ));
      res.fold(
          (failure) => errorMessage = _mapFailureToMessage(failure),
          (resCost) => resCost.totalPrice != null
              ? cost = resCost.totalPrice!
              : cost = 0);

      isLoading = false;
    } else {
      errorMessage = 'No item selected!';
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return (failure as ServerFailure).message;
      case NetworkFailure:
        return 'No Connection';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected error';
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
