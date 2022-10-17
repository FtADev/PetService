import 'package:flutter/material.dart';
import 'package:pet_service/ui/components/animal_card.dart';
import 'package:pet_service/ui/view_models/cat_view_model.dart';
import 'package:pet_service/ui/view_models/dog_view_model.dart';
import 'package:pet_service/ui/choose_services_screen.dart';
import 'package:provider/provider.dart';

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
        AnimalCard(
            text: "Cat",
            detail:
                "${0} Nights ${(false) ? "without" : "with"} Grooming",
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
            detail:
                "${0} Nights ${(false) ? "without" : "with"} Grooming",
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ChooseServices(text: "Dog"),
              ),
            ),
          ),
      ]),
    );
  }
}
