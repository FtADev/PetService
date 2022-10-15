import 'package:flutter/material.dart';
import 'package:pet_service/home_view_model.dart';
import 'package:provider/provider.dart';

import '../cat_view_model.dart';
import '../dog_view_model.dart';

class MyWidget extends StatelessWidget {
  final String text;

  const MyWidget({super.key, required this.text});

  showTextDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => MyDialog(
        text: text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Show modal'),
      onPressed: () => showTextDialog(context),
    );
  }
}

class MyDialog extends StatelessWidget {
  final String text;

  const MyDialog({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

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
                  icon: Icon(Icons.expand_more)),
              Text("${viewModel.nightsNumber} Nights"),
              IconButton(
                  onPressed: viewModel.increaseNights,
                  icon: Icon(Icons.expand_less)),
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
            //Save

            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
