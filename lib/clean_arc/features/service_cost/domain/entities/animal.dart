import 'package:equatable/equatable.dart';

import 'services.dart';

class Animal extends Equatable{
  Services? services;

  Animal({this.services});

  @override
  List<Object?> get props => [services];
}