import 'package:equatable/equatable.dart';

import 'hotel.dart';

class Services extends Equatable{
  bool? grooming;
  Hotel? hotel;

  Services({this.grooming, this.hotel});

  @override
  List<Object?> get props => [grooming, hotel];
}
