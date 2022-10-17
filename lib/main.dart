import 'package:flutter/material.dart';
import 'package:pet_service/service_cost/domain/usecases/get_calculated_cost.dart';
import 'package:pet_service/di/injection_container.dart';
import 'package:pet_service/service_cost/presentation/home/provider/home_view_model.dart';
import 'package:provider/provider.dart';

import '/service_cost/presentation/animal/provider/cat_view_model.dart';
import '/service_cost/presentation/animal/provider/dog_view_model.dart';
import '/service_cost/presentation/home/pages/home_screen.dart';
import 'di/injection_container.dart' as di;

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
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(getCalculatedCostUseCase: usecase),
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
