import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCalculatedCostEvent extends HomeEvent {
  final bool isCatGrooming;
  final int catNights;
  final bool isDogGrooming;
  final int dogNights;

  GetCalculatedCostEvent({
    required this.isCatGrooming,
    required this.catNights,
    required this.isDogGrooming,
    required this.dogNights,
  });

  @override
  List<Object> get props =>
      [isCatGrooming, catNights, isDogGrooming, dogNights];
}
