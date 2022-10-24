import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/cost.dart';
import '../../domain/repositories/service_repository.dart';
import '../datasources/cost_data_source.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final CostDataSource dataSource;

  ServiceRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, Cost>> getCalculatedCost(
      {required bool isCatGrooming,
      required int catNights,
      required bool isDogGrooming,
      required int dogNights}) async {
    try {
      final remoteCost = await dataSource.getCalculatedCost(
        isCatGrooming: isCatGrooming,
        catNights: catNights,
        isDogGrooming: isDogGrooming,
        dogNights: dogNights,
      );
      return Right(remoteCost);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException {
      return Left(NetworkFailure());
    }
  }
}
