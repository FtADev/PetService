import 'package:flutter/material.dart';
import 'package:pet_service/home_view_model.dart';
import 'package:pet_service/ui/NightsNumberDialog.dart';
import 'package:pet_service/ui/components/check_box.dart';
import 'package:pet_service/ui/my_colors.dart';
import 'package:provider/provider.dart';

class ChooseServices extends StatelessWidget {
  final String text;

  const ChooseServices({super.key, required this.text});
  @override
  Widget build(BuildContext context) {

    return Consumer<HomeViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("$text Service"),
        ),
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text(
              "Please select your service:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            CheckBox(
              title: "Grooming",
              containerColor: blue,
              containerBorderColor: blue_border,
              isSelected: viewModel.isGrooming,
              onChange: viewModel.changeGrooming,
            ),
            const SizedBox(
              height: 16,
            ),
            CheckBox(
              title: "Reserving Hotel",
              containerColor: blue,
              containerBorderColor: blue_border,
              isSelected: viewModel.isReservingHotel,
              onChange: viewModel.changeReservingHotel,
            ),
            MyWidget()
          ]),
        ),
      );
    });
  }
}
