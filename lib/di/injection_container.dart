import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pet_service/clean_arc/features/service_cost/data/datasources/cost_remote_data_source.dart';
import 'package:pet_service/clean_arc/features/service_cost/data/repositories/service_repository_impl.dart';
import 'package:pet_service/clean_arc/features/service_cost/domain/repositories/service_repository.dart';
import 'package:pet_service/clean_arc/features/service_cost/domain/usecases/get_calculated_cost.dart';
import 'package:pet_service/ui/view_models/home_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../clean_arc/core/dio_client.dart';
import '../clean_arc/core/network/network_info.dart';
import '../clean_arc/features/service_cost/presentation/home/bloc/home_bloc.dart';


final getIt = GetIt.instance;

Future<void> init() async {

  // Bloc
  getIt.registerFactory(
    () => HomeBloc(
      usecase: getIt(),
    ),
  );

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
