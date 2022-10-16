import 'package:pet_service/clean_arc/features/service_cost/domain/entities/animal.dart';

import 'services_model.dart';

class AnimalModel extends Animal{

  AnimalModel({services}): super(services: services);

  AnimalModel.fromJson(Map<String, dynamic> json) {
    services = json['services'] != null
        ?  ServicesModel.fromJson(json['services'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (services != null) {
      data['services'] = (services as ServicesModel).toJson();
    }
    return data;
  }
}