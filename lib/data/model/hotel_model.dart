class Hotel {
  int? nights;

  Hotel({this.nights});

  Hotel.fromJson(Map<String, dynamic> json) {
    nights = json['nights'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['nights'] = nights;
    return data;
  }
}