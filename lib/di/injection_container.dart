import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/network/dio_client.dart';
import '../service_cost/data/datasources/cost_data_source.dart';
import '../service_cost/data/repositories/service_repository_impl.dart';
import '../service_cost/domain/repositories/service_repository.dart';
import '../service_cost/domain/usecases/get_calculated_cost.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Use cases
  getIt.registerLazySingleton(
      () => GetCalculatedCostUseCase(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<ServiceRepository>(
    () => ServiceRepositoryImpl(
      dataSource: getIt(),
    ),
  );

  // Data sources
  // If you want to read data from other data source,
  // you can just change CostRemoteDataSourceImpl to what you want
  // for example: getIt.registerLazySingleton<CostDataSource>(
  //     () => CostLocalDataSourceImpl(),
  //   );
  getIt.registerLazySingleton<CostDataSource>(
    () => CostRemoteDataSourceImpl(
      dioClient: getIt(),
    ),
  );

  //! External
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(dio: getIt<Dio>()));
}
