import 'package:pet_service/service_cost/domain/entities/hotel.dart';

class HotelModel extends Hotel {

  HotelModel({nights}): super(nights: nights);

  HotelModel.fromJson(Map<String, dynamic> json) {
    nights = json['nights'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['nights'] = nights;
    return data;
  }
}