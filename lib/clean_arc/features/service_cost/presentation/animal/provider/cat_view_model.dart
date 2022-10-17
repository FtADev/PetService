import 'package:flutter/material.dart';
import 'package:pet_service/clean_arc/features/service_cost/presentation/animal/provider/animal_view_model.dart';
import 'package:provider/provider.dart';

class CatViewModel extends AnimalViewModel {
  static CatViewModel of(BuildContext context) =>
      Provider.of<CatViewModel>(context, listen: false);
}