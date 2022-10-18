import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/cost.dart';
import '../../../domain/usecases/get_calculated_cost.dart';

class HomeViewModel extends ChangeNotifier {
  final GetCalculatedCostUseCase getCalculatedCostUseCase;

  HomeViewModel({required this.getCalculatedCostUseCase});

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

  static HomeViewModel of(BuildContext context) =>
      Provider.of<HomeViewModel>(context, listen: false);

  Future calculateRequest({
    required bool isCatGrooming,
    required int catNights,
    required bool isDogGrooming,
    required int dogNights,
  }) async {
    errorMessage = "";
    isLoading = true;
    Either<Failure, Cost> res = await getCalculatedCostUseCase(Params(
      dogNights: dogNights,
      isDogGrooming: isDogGrooming,
      catNights: catNights,
      isCatGrooming: isCatGrooming,
    ));
    res.fold(
        (failure) => errorMessage = _mapFailureToMessage(failure),
        (resCost) => resCost.totalPrice != null ? cost = resCost.totalPrice! : cost = 0);

    isLoading = false;
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
}
