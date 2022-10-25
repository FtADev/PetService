import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_service/core/network/api.dart';
import 'package:pet_service/core/network/api_request.dart';
import 'package:pet_service/service_cost/data/api/get_cost_api.dart';
import 'package:pet_service/service_cost/data/api/get_cost_api_request.dart';

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

  // Data Source
  getIt.registerLazySingleton<CostDataSource>(
    () => CostRemoteDataSourceImpl(
      api: getIt(),
    ),
  );

  // API
  getIt.registerLazySingleton<API>(
    () => GetCostApi(),
  );

  // Network
  getIt.registerSingleton(Dio());
}
