import 'package:dartz/dartz.dart';
import 'package:pet_service/clean_arc/features/service_cost/domain/entities/cost.dart';
import 'package:pet_service/clean_arc/features/service_cost/domain/repositories/service_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/cost_remote_data_source.dart';

typedef Future<Cost> _ConcreteOrRandomChooser();

class ServiceRepositoryImpl implements ServiceRepository {
  final CostRemoteDataSource remoteDataSource;
  // final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ServiceRepositoryImpl({
    required this.remoteDataSource,
    // required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Cost>> getCalculatedConst({required bool isCatGrooming, required int catNights, required bool isDogGrooming, required int dogNights})
    async {
      return await _getCost(() {
        return remoteDataSource.getCalculatedCost(
          isCatGrooming: isCatGrooming,
          catNights: catNights,
          isDogGrooming: isDogGrooming,
          dogNights: dogNights,);
      });
  }

//TODO(This method should be in datasource)
  Future<Either<Failure, Cost>> _getCost(
    _ConcreteOrRandomChooser getConcreteOrRandom,
  ) async {
    // if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getConcreteOrRandom();
        // localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    // } else {
    //   try {
    //     // final localTrivia = await localDataSource.getLastNumberTrivia();
    //     // return Right(localTrivia);
    //   } on CacheException {
    //     return Left(CacheFailure());
    //   }
    // }
  }


}
