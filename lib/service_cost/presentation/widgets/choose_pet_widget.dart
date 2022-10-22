import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_service/service_cost/presentation/pages/choose_services_screen.dart';

import '../provider/all_providers.dart';
import 'animal_card.dart';

class ChoosePetWidget extends ConsumerWidget {
  const ChoosePetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              "${ref.watch(catModel).nightsNumber} Nights ${(!ref.watch(catModel).isGrooming) ? "without" : "with"} Grooming",
          onTap: () => goToChooseServicePage(context, "Cat"),
        ),
        const SizedBox(
          width: 8,
        ),
        AnimalCard(
          text: "Dog",
          detail:
              "${ref.watch(dogModel).nightsNumber} Nights ${(!ref.watch(dogModel).isGrooming) ? "without" : "with"} Grooming",
          onTap: () => goToChooseServicePage(context, "Dog"),
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
