import 'package:pet_service/service_cost/domain/entities/request.dart';

import 'animal_model.dart';

class RequestModel extends Request{

  RequestModel({dog, cat}): super(dog: dog, cat: cat);

  RequestModel.fromJson(Map<String, dynamic> json) {
    dog = json['dog'] != null ?  AnimalModel.fromJson(json['dog']) : null;
    cat = json['cat'] != null ?  AnimalModel.fromJson(json['cat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (dog != null) {
      data['dog'] = (dog as AnimalModel).toJson();
    }
    if (cat != null) {
      data['cat'] = (cat as AnimalModel).toJson();
    }
    return data;
  }
}



