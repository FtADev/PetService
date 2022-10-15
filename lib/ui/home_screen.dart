import 'package:flutter/material.dart';
import 'package:pet_service/cat_view_model.dart';
import 'package:pet_service/dog_view_model.dart';
import 'package:pet_service/home_view_model.dart';
import 'package:pet_service/model/animal_model.dart';
import 'package:pet_service/model/calculate_request_model.dart';
import 'package:pet_service/model/hotel_model.dart';
import 'package:pet_service/model/services_model.dart';
import 'package:pet_service/ui/choose_pet_widget.dart';
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
              viewModel.cost == 0 ? Container() : Text("\$ ${viewModel.cost}"),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                child: const Text("Calculate Cost"),
                onPressed: () async {
                  CalculateRequestModel requestModel = CalculateRequestModel(
                    cat: Animal(
                      services: Services(
                        grooming: catModel.isGrooming,
                        hotel: Hotel(
                          nights: catModel.nightsNumber,
                        ),
                      ),
                    ),
                    dog: Animal(
                      services: Services(
                        grooming: dogModel.isGrooming,
                        hotel: Hotel(
                          nights: dogModel.nightsNumber,
                        ),
                      ),
                    ),
                  );
                  await viewModel.calculateRequest(requestModel);
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
