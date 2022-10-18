import 'package:equatable/equatable.dart';

import 'animal.dart';

class Request extends Equatable{
  Animal? dog;
  Animal? cat;

  Request({this.dog, this.cat});

  @override
  List<Object?> get props => [dog, cat];

}



