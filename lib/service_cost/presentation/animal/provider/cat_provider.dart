import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'animal_provider.dart';

class CatProvider extends AnimalProvider {
  static CatProvider of(BuildContext context) =>
      Provider.of<CatProvider>(context, listen: false);
}