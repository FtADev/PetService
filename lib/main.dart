import 'package:flutter/material.dart';
import 'package:pet_service/di/injection_container.dart';
import 'package:pet_service/ui/view_models/cat_view_model.dart';
import 'package:pet_service/ui/view_models/dog_view_model.dart';
import 'package:pet_service/ui/home_screen.dart';
import 'package:pet_service/ui/view_models/home_view_model.dart';
import 'package:provider/provider.dart';
import 'clean_arc/features/service_cost/domain/repositories/service_repository.dart';
import 'di/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final serviceRepository = getIt.get<ServiceRepository>(); //TODO(REMOVE)

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
