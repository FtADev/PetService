import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'animal_provider.dart';

class DogProvider extends AnimalProvider {
  static DogProvider of(BuildContext context) =>
      Provider.of<DogProvider>(context, listen: false);
}