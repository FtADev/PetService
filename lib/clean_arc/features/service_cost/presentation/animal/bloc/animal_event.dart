import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AnimalEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeGroomingEvent extends AnimalEvent {}

class ChangeHotelEvent extends AnimalEvent {}

class IncrementEvent extends AnimalEvent {}

class DecrementEvent extends AnimalEvent {}
