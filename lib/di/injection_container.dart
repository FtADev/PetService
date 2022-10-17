import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pet_service/clean_arc/features/service_cost/data/datasources/cost_remote_data_source.dart';
import 'package:pet_service/clean_arc/features/service_cost/data/repositories/service_repository_impl.dart';
import 'package:pet_service/clean_arc/features/service_cost/domain/repositories/service_repository.dart';
import 'package:pet_service/clean_arc/features/service_cost/domain/usecases/get_calculated_cost.dart';
import 'package:pet_service/clean_arc/features/service_cost/presentation/bloc/home/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../clean_arc/core/dio_client.dart';
import '../clean_arc/core/network/network_info.dart';


final getIt = GetIt.instance;

Future<void> init() async {
  // final sharedPreferences = await SharedPreferences.getInstance();
  //
  // getIt.registerSingleton(Dio());
  // getIt.registerSingleton(DioClient(getIt<Dio>()));
  // getIt.registerSingleton(ServicesApi(dioClient: getIt<DioClient>()));
  // getIt.registerSingleton(InternetConnectionChecker());
  // getIt.registerSingleton(NetworkInfo(getIt<InternetConnectionChecker>()));
  // getIt.registerSingleton(LocalDataSource(sharedPreferences: sharedPreferences));
  // getIt.registerSingleton(ServiceRepository());
  // getIt.registerSingleton(GetCalculatedCost(getIt.get<ServiceRepository>()));
  // getIt.registerSingleton(HomeBloc(cost: getIt.get<GetCalculatedCost>()));


  //! Features - Number Trivia
  // Bloc
  getIt.registerFactory(
    () => HomeBloc(
      usecase: getIt(),
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

  // getIt.registerLazySingleton<NumberTriviaLocalDataSource>(
  //   () => NumberTriviaLocalDataSourceImpl(sharedPreferences: getIt()),
  // );

  //! Core
  // getIt.registerLazySingleton(() => InputConverter());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: getIt()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio(getIt()));
  getIt.registerLazySingleton(() => DioClient(getIt()));
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
