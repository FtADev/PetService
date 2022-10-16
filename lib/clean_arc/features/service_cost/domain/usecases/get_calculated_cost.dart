import 'package:dartz/dartz.dart';
import 'package:pet_service/clean_arc/features/service_cost/domain/entities/cost.dart';
import 'package:pet_service/clean_arc/features/service_cost/domain/entities/request.dart';
import 'package:pet_service/clean_arc/features/service_cost/domain/repositories/service_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetCalculatedCost implements UseCase<Cost, Request> {
  final ServiceRepository repository;

  GetCalculatedCost(this.repository);

  @override
  Future<Either<Failure, Cost>> call(Request request) async {
    return await repository.getCalculatedConst(
      isCatGrooming: request.cat!.services!.grooming!,
      catNights: request.cat!.services!.hotel!.nights!,
      isDogGrooming: request.dog!.services!.grooming!,
      dogNights: request.dog!.services!.hotel!.nights!,
    );
  }
}
