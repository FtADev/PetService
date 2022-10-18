import 'package:pet_service/service_cost/domain/entities/services.dart';

import 'hotel_model.dart';

class ServicesModel extends Services {

  ServicesModel({grooming, hotel}): super(grooming: grooming, hotel: hotel);

  ServicesModel.fromJson(Map<String, dynamic> json) {
    grooming = json['grooming'];
    hotel = json['hotel'] != null ?  HotelModel.fromJson(json['hotel']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['grooming'] = grooming;
    if (hotel != null) {
      data['hotel'] = (hotel as HotelModel).toJson();
    }
    return data;
  }
}
