import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cat_provider.dart';
import 'dog_provider.dart';
import 'home_provider.dart';

final homeModel = ChangeNotifierProvider((_) => HomeProvider());
final catModel = ChangeNotifierProvider((_) => CatProvider());
final dogModel = ChangeNotifierProvider((_) => DogProvider());