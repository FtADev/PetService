import 'package:flutter/material.dart';
import 'package:pet_service/ui/view_models/cat_view_model.dart';
import 'package:pet_service/ui/view_models/dog_view_model.dart';
import 'package:provider/provider.dart';

class DialogWidget extends StatelessWidget {
  final String text;

  const DialogWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return text == "Cat"
        ? Consumer<CatViewModel>(builder: (context, viewModel, child) {
            return MyAlertDialog(
              viewModel: viewModel,
            );
          })
        : Consumer<DogViewModel>(builder: (context, viewModel, child) {
            return MyAlertDialog(
              viewModel: viewModel,
            );
          });
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
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
