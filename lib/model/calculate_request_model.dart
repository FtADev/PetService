import 'animal_model.dart';

class CalculateRequestModel {
  Animal? dog;
  Animal? cat;

  CalculateRequestModel({this.dog, this.cat});

  CalculateRequestModel.fromJson(Map<String, dynamic> json) {
    dog = json['dog'] != null ?  Animal.fromJson(json['dog']) : null;
    cat = json['cat'] != null ?  Animal.fromJson(json['cat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (dog != null) {
      data['dog'] = dog!.toJson();
    }
    if (cat != null) {
      data['cat'] = cat!.toJson();
    }
    return data;
  }
}



