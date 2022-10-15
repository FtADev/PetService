import 'package:flutter/material.dart';
import 'package:pet_service/ui/choose_services_screen.dart';

import 'components/animal_card.dart';

class ChoosePetScreen extends StatelessWidget {
  const ChoosePetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
        ]),
      ),
    );
  }
}
