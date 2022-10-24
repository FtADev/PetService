import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_service/service_cost/domain/entities/cost.dart';
import 'package:pet_service/service_cost/domain/repositories/service_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetCalculatedCostUseCase implements UseCase<Cost, Params> {
  final ServiceRepository repository;

  GetCalculatedCostUseCase({required this.repository});

  @override
  Future<Either<Failure, Cost>> call(Params params) async {
    return await repository.getCalculatedCost(
      isCatGrooming: params.isCatGrooming,
      catNights: params.catNights,
      isDogGrooming: params.isDogGrooming,
      dogNights: params.dogNights,
    );
  }
}

class Params extends Equatable {
  final bool isCatGrooming;
  final int catNights;
  final bool isDogGrooming;
  final int dogNights;

  const Params({
    required this.isCatGrooming,
    required this.catNights,
    required this.isDogGrooming,
    required this.dogNights,
  });

  @override
  List<Object> get props =>
      [isCatGrooming, catNights, isDogGrooming, dogNights];
}
