import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/dio_client.dart';
import '../core/network/network_info.dart';
import '../service_cost/data/datasources/cost_remote_data_source.dart';
import '../service_cost/data/repositories/service_repository_impl.dart';
import '../service_cost/domain/repositories/service_repository.dart';
import '../service_cost/domain/usecases/get_calculated_cost.dart';
import '../service_cost/presentation/home/provider/home_view_model.dart';


final getIt = GetIt.instance;

Future<void> init() async {

  // Provider
  getIt.registerFactory(
        () => HomeViewModel(
      getCalculatedCostUseCase: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetCalculatedCostUseCase(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<ServiceRepository>(
    () => ServiceRepositoryImpl(
      // localDataSource: getIt(),
      networkInfo: getIt(),
      remoteDataSource: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<CostRemoteDataSource>(
    () => CostRemoteDataSourceImpl(dioClient: getIt()),
  );

  //! Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: getIt()));

  //! External
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(dio: getIt<Dio>()));
  getIt.registerLazySingleton(() => InternetConnectionChecker());

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}
