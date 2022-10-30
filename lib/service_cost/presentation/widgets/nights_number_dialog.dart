import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/all_providers.dart';

class DialogWidget extends ConsumerWidget {
  final String text;

  const DialogWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return text == "Cat"
        ? MyAlertDialog(
            model: ref.watch(catModel),
          )
        : MyAlertDialog(
            model: ref.watch(dogModel),
          );
  }
}

class MyAlertDialog extends StatelessWidget {
  final model;

  const MyAlertDialog({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Nights Number"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("How many nights do you want to reserve?"),
          Row(
            children: [
              IconButton(
                onPressed: model.decreaseNights,
                icon: const Icon(
                  Icons.expand_more,
                ),
              ),
              Text("${model.nightsNumber} Nights"),
              IconButton(
                onPressed: model.increaseNights,
                icon: const Icon(
                  Icons.expand_less,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Save'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
