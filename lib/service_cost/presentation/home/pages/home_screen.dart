import 'package:flutter/material.dart';
import 'package:pet_service/service_cost/presentation/animal/provider/cat_provider.dart';
import 'package:pet_service/service_cost/presentation/animal/provider/dog_provider.dart';
import 'package:pet_service/service_cost/presentation/home/widgets/choose_pet_widget.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CatProvider catModel = CatProvider.of(context);
    DogProvider dogModel = DogProvider.of(context);

    return Consumer<HomeProvider>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Pet Service"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ChoosePetWidget(),
              const SizedBox(
                height: 50,
              ),
              viewModel.errorMessage == ""
                  ? Text(
                      "\$ ${viewModel.cost}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      viewModel.errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                child: viewModel.isLoading
                    ? Container(
                        margin: const EdgeInsets.all(5),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text("Calculate Cost"),
                onPressed: () async => await viewModel.calculateRequest(
                  dogNights: dogModel.nightsNumber,
                  isDogGrooming: dogModel.isGrooming,
                  catNights: catModel.nightsNumber,
                  isCatGrooming: catModel.isGrooming,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
