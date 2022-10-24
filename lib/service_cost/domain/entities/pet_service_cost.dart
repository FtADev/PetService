import 'package:equatable/equatable.dart';

class PetServiceCost extends Equatable {
  final bool isCatGrooming;
  final int catNights;
  final bool isDogGrooming;
  final int dogNights;

  const PetServiceCost({
    required this.isCatGrooming,
    required this.catNights,
    required this.isDogGrooming,
    required this.dogNights,
  });

  @override
  List<Object?> get props => [isCatGrooming, catNights, isDogGrooming, dogNights];
}