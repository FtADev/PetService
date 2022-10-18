import 'package:flutter/material.dart';
import 'package:pet_service/service_cost/presentation/animal/provider/cat_provider.dart';
import 'package:pet_service/service_cost/presentation/animal/provider/dog_provider.dart';
import 'package:provider/provider.dart';

class DialogWidget extends StatelessWidget {
  final String text;

  const DialogWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return text == "Cat"
        ? Consumer<CatProvider>(
            builder: (context, viewModel, child) => MyAlertDialog(
              viewModel: viewModel,
            ),
          )
        : Consumer<DogProvider>(
            builder: (context, viewModel, child) => MyAlertDialog(
              viewModel: viewModel,
            ),
          );
  }
}

class MyAlertDialog extends StatelessWidget {
  final viewModel;

  const MyAlertDialog({Key? key, this.viewModel}) : super(key: key);

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
                onPressed: viewModel.decreaseNights,
                icon: const Icon(
                  Icons.expand_more,
                ),
              ),
              Text("${viewModel.nightsNumber} Nights"),
              IconButton(
                onPressed: viewModel.increaseNights,
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
