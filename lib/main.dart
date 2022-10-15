import 'package:flutter/material.dart';
import 'package:pet_service/cat_view_model.dart';
import 'package:pet_service/dog_view_model.dart';
import 'package:pet_service/ui/home_screen.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(),
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
