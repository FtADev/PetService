import 'package:equatable/equatable.dart';

class Hotel extends Equatable{
  int? nights;

  Hotel({this.nights});

  @override
  List<Object?> get props => [nights];
}