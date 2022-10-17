import 'package:flutter/material.dart';
import 'package:pet_service/service_cost/presentation/animal/provider/animal_view_model.dart';
import 'package:provider/provider.dart';

class DogViewModel extends AnimalViewModel {
  static DogViewModel of(BuildContext context) =>
      Provider.of<DogViewModel>(context, listen: false);
}