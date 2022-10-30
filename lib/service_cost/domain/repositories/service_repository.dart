import 'package:dartz/dartz.dart';
import 'package:pet_service/service_cost/domain/entities/cost.dart';
import 'package:pet_service/service_cost/domain/entities/pet_service_cost.dart';

import '../../../../core/error/failures.dart';

abstract class ServiceRepository {
  Future<Either<Failure, Cost>> getCalculatedCost({
    required PetServiceCost petServiceCost,
  });
}
