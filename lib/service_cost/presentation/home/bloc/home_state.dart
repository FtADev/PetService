import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pet_service/service_cost/domain/entities/cost.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class LoadedState extends HomeState {
  final Cost cost;

  LoadedState({required this.cost});

  @override
  List<Object> get props => [cost];
}

class ErrorState extends HomeState {
  final String message;

  ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
