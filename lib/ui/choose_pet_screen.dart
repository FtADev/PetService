import 'package:flutter/material.dart';
import 'package:pet_service/cat_view_model.dart';
import 'package:pet_service/dog_view_model.dart';
import 'package:pet_service/home_view_model.dart';
import 'package:pet_service/model/animal_model.dart';
import 'package:pet_service/model/calculate_request_model.dart';
import 'package:pet_service/model/hotel_model.dart';
import 'package:pet_service/model/services_model.dart';
import 'package:pet_service/ui/choose_services_screen.dart';

import 'components/animal_card.dart';

class ChoosePetScreen extends StatelessWidget {
  const ChoosePetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  HomeViewModel homeModel = HomeViewModel.of(context);
  CatViewModel catModel = CatViewModel.of(context);
  DogViewModel dogModel = DogViewModel.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Service"),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text(
            "Please select your pet:",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimalCard(
                text: "Cat",
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChooseServices(text: "Cat"),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              AnimalCard(
                text: "Dog",
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChooseServices(text: "Dog"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50,),
          Text("\$ ${homeModel.cost}"),
          SizedBox(height: 8,),
          ElevatedButton(
            child: const Text("Calculate Cost"),
            onPressed: () async {
              CalculateRequestModel requestModel = CalculateRequestModel(
                  cat: Animal(
                      services: Services(
                          grooming: catModel.isGrooming,
                          hotel: Hotel(
                              nights: catModel.nightsNumber
                          )
                      )
                  ),
                  dog: Animal(
                      services: Services(
                          grooming: dogModel.isGrooming,
                          hotel: Hotel(
                              nights: dogModel.nightsNumber
                          )
                      )
                  )
              );
              await homeModel.calculateRequest(requestModel);
            } ,
          )
        ]),
      ),
    );
  }
}
