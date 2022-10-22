import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_service/di/injection_container.dart';
import 'package:pet_service/service_cost/domain/usecases/get_calculated_cost.dart';

import 'animal/provider/cat_provider.dart';
import 'animal/provider/dog_provider.dart';
import 'home/provider/home_provider.dart';

final homeModel = ChangeNotifierProvider((_) => HomeProvider());
final catModel = ChangeNotifierProvider((_) => CatProvider());
final dogModel = ChangeNotifierProvider((_) => DogProvider());