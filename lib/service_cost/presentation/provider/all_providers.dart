import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_service/service_cost/presentation/provider/animal_provider.dart';
import 'home_provider.dart';

final homeModel = ChangeNotifierProvider((_) => HomeProvider());
final catModel = ChangeNotifierProvider((_) => AnimalProvider());
final dogModel = ChangeNotifierProvider((_) => AnimalProvider());