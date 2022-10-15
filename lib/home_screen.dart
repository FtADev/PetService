import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (BuildContext context, model, Widget? child) => Scaffold(
          appBar: AppBar(
            title: const Text("Pet Service"),
          ),
          body: Container(),
        ),
      ),
    );
  }
}
