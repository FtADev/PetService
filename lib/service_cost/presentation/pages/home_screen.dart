import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/all_providers.dart';
import '../widgets/choose_pet_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            ref.watch(homeModel).isLoading
                ? Container()
                : ref.watch(homeModel).errorMessage == ""
                    ? (ref.watch(homeModel).cost != 0
                        ? Text(
                            "\$ ${ref.watch(homeModel).cost}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Container())
                    : Text(
                        ref.watch(homeModel).errorMessage,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: ref.watch(homeModel).isLoading
                  ? Container(
                      margin: const EdgeInsets.all(5),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const Text("Calculate Cost"),
              onPressed: () async =>
                  await ref.watch(homeModel).calculateRequest(
                        dogNights: ref.read(dogModel).nightsNumber,
                        isDogGrooming: ref.read(dogModel).isGrooming,
                        catNights: ref.read(catModel).nightsNumber,
                        isCatGrooming: ref.read(catModel).isGrooming,
                      ),
            )
          ],
        ),
      ),
    );
  }
}
