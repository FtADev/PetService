import 'package:flutter/material.dart';
import 'package:pet_service/clean_arc/features/service_cost/presentation/animal/pages/choose_services_screen.dart';
import 'package:provider/provider.dart';

import '../../animal/provider/cat_view_model.dart';
import '../../animal/provider/dog_view_model.dart';
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
        Consumer<CatViewModel>(
          builder: (context, catModel, child) => AnimalCard(
            text: "Cat",
            detail:
            "${catModel.nightsNumber} Nights ${(!catModel.isGrooming) ? "without" : "with"} Grooming",
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ChooseServices(text: "Cat"),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Consumer<DogViewModel>(
          builder: (context, dogModel, child) => AnimalCard(
            text: "Dog",
            detail:
            "${dogModel.nightsNumber} Nights ${(!dogModel.isGrooming) ? "without" : "with"} Grooming",
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ChooseServices(text: "Dog"),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
