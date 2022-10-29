import 'package:dartz/dartz.dart';
import 'package:pet_service/service_cost/domain/entities/cost.dart';
import 'package:pet_service/service_cost/domain/entities/pet_service_cost.dart';
import 'package:pet_service/service_cost/domain/repositories/service_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetCalculatedCostUseCase implements UseCase<Cost, PetServiceCost> {
  final ServiceRepository repository;

  GetCalculatedCostUseCase({required this.repository});

  @override
  Future<Either<Failure, Cost>> call(PetServiceCost petServiceCost) async {
    return await repository.getCalculatedCost(petServiceCost: petServiceCost);
  }
}
