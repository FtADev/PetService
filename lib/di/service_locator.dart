import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pet_service/data/local/local_data_source.dart';
import 'package:pet_service/data/network/api/service/network_info.dart';
import 'package:pet_service/data/network/api/service/services_api.dart';
import 'package:pet_service/data/network/dio_client.dart';
import 'package:pet_service/data/repository/service_repository.dart';
import 'package:pet_service/ui/view_models/home_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(ServicesApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(InternetConnectionChecker());
  getIt.registerSingleton(NetworkInfo(getIt<InternetConnectionChecker>()));
  getIt.registerSingleton(LocalDataSource(sharedPreferences: sharedPreferences));
  getIt.registerSingleton(ServiceRepository(serviceApi: getIt.get<ServicesApi>(), networkInfo: getIt.get<NetworkInfo>(), localDataSource: getIt.get<LocalDataSource>()));
  getIt.registerSingleton(HomeViewModel(getIt.get<ServiceRepository>()));
}
