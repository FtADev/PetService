import 'package:flutter/material.dart';
import 'package:pet_service/ui/choose_pet_widget.dart';
import 'package:pet_service/ui/view_models/cat_view_model.dart';
import 'package:pet_service/ui/view_models/dog_view_model.dart';
import 'package:pet_service/ui/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CatViewModel catModel = CatViewModel.of(context);
    DogViewModel dogModel = DogViewModel.of(context);

    return Consumer<HomeViewModel>(builder: (context, viewModel, child) {
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
              viewModel.cost == 0
                  ? Container()
                  : Text(
                      "\$ ${viewModel.cost}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
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
                onPressed: () async {
                  await viewModel.calculateRequest(
                    dogNights: dogModel.nightsNumber,
                    isDogGrooming: dogModel.isGrooming,
                    catNights: catModel.nightsNumber,
                    isCatGrooming: catModel.isGrooming,
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
