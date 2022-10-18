import 'package:flutter/material.dart';
import 'package:pet_service/service_cost/presentation/animal/pages/choose_services_screen.dart';
import 'package:pet_service/service_cost/presentation/animal/provider/cat_provider.dart';
import 'package:pet_service/service_cost/presentation/animal/provider/dog_provider.dart';
import 'package:provider/provider.dart';

import '../../animal/widgets/animal_card.dart';

class ChoosePetWidget extends StatelessWidget {
  const ChoosePetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text(
          "Please select your pet:",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Consumer<CatProvider>(
          builder: (context, catModel, child) => AnimalCard(
            text: "Cat",
            detail:
            "${catModel.nightsNumber} Nights ${(!catModel.isGrooming) ? "without" : "with"} Grooming",
            onTap: () => goToChooseServicePage(context, "Cat"),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Consumer<DogProvider>(
          builder: (context, dogModel, child) => AnimalCard(
            text: "Dog",
            detail:
            "${dogModel.nightsNumber} Nights ${(!dogModel.isGrooming) ? "without" : "with"} Grooming",
            onTap: () => goToChooseServicePage(context, "Dog"),
          ),
        ),
      ]),
    );
  }

  void goToChooseServicePage(BuildContext context, String title) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChooseServices(text: title),
      ),
    );
  }

}
