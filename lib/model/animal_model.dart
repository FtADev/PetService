import 'services_model.dart';

class Animal {
  Services? services;

  Animal({this.services});

  Animal.fromJson(Map<String, dynamic> json) {
    services = json['services'] != null
        ?  Services.fromJson(json['services'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (services != null) {
      data['services'] = services!.toJson();
    }
    return data;
  }
}