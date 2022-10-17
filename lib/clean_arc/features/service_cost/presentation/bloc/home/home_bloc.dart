import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:pet_service/clean_arc/features/service_cost/domain/entities/cost.dart';
import 'package:pet_service/clean_arc/features/service_cost/domain/usecases/get_calculated_cost.dart';
import 'package:pet_service/clean_arc/features/service_cost/presentation/bloc/home/home_event.dart';
import 'package:pet_service/clean_arc/features/service_cost/presentation/bloc/home/home_state.dart';

import '../../../../../core/error/failures.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCalculatedCostUseCase getCalculatedCost;

  HomeBloc({
    required GetCalculatedCostUseCase usecase,
  })  : assert(usecase != null),
        getCalculatedCost = usecase,
        super(InitialState()) {

    on<GetCalculatedCostEvent>(_onCalculate);

  }

  _onCalculate(GetCalculatedCostEvent event, Emitter<HomeState> emit) async {
    emit(LoadingState());
    var result = await getCalculatedCost(Params(
      isCatGrooming: event.isCatGrooming,
      catNights: event.catNights,
      isDogGrooming: event.isDogGrooming,
      dogNights: event.dogNights,
    ));
    result.fold(
            (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
            (cost) => { emit(LoadedState(cost: cost)),
        });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
