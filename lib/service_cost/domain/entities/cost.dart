import 'package:equatable/equatable.dart';

class Cost extends Equatable{
  int? totalPrice;

  Cost({this.totalPrice});

  @override
  List<Object?> get props => [totalPrice];

}