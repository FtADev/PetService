import 'package:flutter/material.dart';
import 'package:pet_service/cat_view_model.dart';
import 'package:pet_service/dog_view_model.dart';
import 'package:pet_service/ui/components/check_box.dart';
import 'package:pet_service/ui/my_colors.dart';
import 'package:pet_service/ui/nights_number_dialog.dart';
import 'package:provider/provider.dart';

class ChooseServices extends StatelessWidget {
  final String text;

  const ChooseServices({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$text Service"),
      ),
      body: text == "Cat"
          ? Consumer<CatViewModel>(builder: (context, viewModel, child) {
              return ServiceWidget(
                viewModel: viewModel,
                text: "Cat",
              );
            })
          : Consumer<DogViewModel>(builder: (context, viewModel, child) {
              return ServiceWidget(
                viewModel: viewModel,
                text: "Dog",
              );
            }),
    );
  }
}

class ServiceWidget extends StatelessWidget {
  final viewModel;
  final String text;

  const ServiceWidget({Key? key, required this.viewModel, required this.text})
      : super(key: key);

  showTextDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => DialogWidget(
        text: text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Please select your service:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            CheckBox(
              title: "Grooming",
              containerColor: blue,
              containerBorderColor: blue_border,
              isSelected: viewModel.isGrooming,
              onChange: viewModel.changeGrooming,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CheckBox(
                title: "Reserving Hotel",
                containerColor: blue,
                containerBorderColor: blue_border,
                isSelected: viewModel.isReservingHotel,
                onChange: viewModel.changeReservingHotel,
              ),
                viewModel.isReservingHotel
                    ? GestureDetector(
                      child: Text(
                        "${viewModel.nightsNumber} Nights",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      onTap: () => showTextDialog(context),
                    )
                    : Container()
      ]
            ),
            const SizedBox(
              height: 16,
            ),
          ]),
    );
  }
}
