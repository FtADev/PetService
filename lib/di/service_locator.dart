import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_service/data/network/api/user/services_api.dart';
import 'package:pet_service/data/network/dio_client.dart';
import 'package:pet_service/data/repository/service_repository.dart';
import 'package:pet_service/ui/view_models/home_view_model.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(ServicesApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(ServiceRepository(getIt.get<ServicesApi>()));
  getIt.registerSingleton(HomeViewModel(getIt.get<ServiceRepository>()));
}
