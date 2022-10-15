import 'package:flutter/material.dart';
import 'package:pet_service/data/repository/service_repository.dart';
import 'package:pet_service/di/service_locator.dart';
import 'package:pet_service/ui/view_models/cat_view_model.dart';
import 'package:pet_service/ui/view_models/dog_view_model.dart';
import 'package:pet_service/ui/home_screen.dart';
import 'package:pet_service/ui/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final serviceRepository = getIt.get<ServiceRepository>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(serviceRepository),
        ),
        ChangeNotifierProvider<CatViewModel>(
          create: (_) => CatViewModel(),
        ),
        ChangeNotifierProvider<DogViewModel>(
          create: (_) => DogViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
