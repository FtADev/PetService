import 'package:dartz/dartz.dart';
import 'package:pet_service/service_cost/domain/entities/cost.dart';

import '../../../../core/error/failures.dart';

abstract class ServiceRepository {
  Future<Either<Failure, Cost>> getCalculatedCost({
    required bool isCatGrooming,
    required int catNights,
    required bool isDogGrooming,
    required int dogNights,
  });
}
