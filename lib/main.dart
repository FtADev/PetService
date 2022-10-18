import 'package:flutter/material.dart';
import 'package:pet_service/service_cost/domain/usecases/get_calculated_cost.dart';
import 'package:pet_service/di/injection_container.dart';
import 'package:pet_service/service_cost/presentation/animal/provider/cat_provider.dart';
import 'package:pet_service/service_cost/presentation/animal/provider/dog_provider.dart';
import 'package:provider/provider.dart';

import '/service_cost/presentation/home/pages/home_screen.dart';
import 'di/injection_container.dart' as di;
import 'service_cost/presentation/home/provider/home_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final usecase = getIt.get<GetCalculatedCostUseCase>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(getCalculatedCostUseCase: usecase),
        ),
        ChangeNotifierProvider<CatProvider>(
          create: (_) => CatProvider(),
        ),
        ChangeNotifierProvider<DogProvider>(
          create: (_) => DogProvider(),
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
