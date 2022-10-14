import 'hotel_model.dart';

class Services {
  bool? grooming;
  Hotel? hotel;

  Services({this.grooming, this.hotel});

  Services.fromJson(Map<String, dynamic> json) {
    grooming = json['grooming'];
    hotel = json['hotel'] != null ?  Hotel.fromJson(json['hotel']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['grooming'] = grooming;
    if (hotel != null) {
      data['hotel'] = hotel!.toJson();
    }
    return data;
  }
}
