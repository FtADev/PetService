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
  final GetCalculatedCost getCalculatedCost;

  HomeBloc({
    required GetCalculatedCost cost,
  })  : assert(cost != null),
        getCalculatedCost = cost,
        super(Empty());

  @override
  HomeState get initialState => Empty();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is CalculateEvent) {
      // yield* event.numberString.fold(
      //   (failure) async* {
      //     yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      //   },
      //   (integer) async* {
      yield Loading();
      final failureOrCost = await getCalculatedCost(Params(
        isCatGrooming: event.isCatGrooming,
        catNights: event.catNights,
        isDogGrooming: event.isDogGrooming,
        dogNights: event.dogNights,
      ));
      yield* _eitherLoadedOrErrorState(failureOrCost);
      // },
      // );
    }
  }

  Stream<HomeState> _eitherLoadedOrErrorState(
    Either<Failure, Cost> failureOrCost,
  ) async* {
    yield failureOrCost.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (cost) => Loaded(cost: cost),
    );
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
