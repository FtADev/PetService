import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pet_service/clean_arc/features/service_cost/domain/entities/cost.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends HomeState {}

class Loading extends HomeState {}

class Loaded extends HomeState {
  final Cost cost;

  Loaded({required this.cost});

  @override
  List<Object> get props => [cost];
}

class Error extends HomeState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
