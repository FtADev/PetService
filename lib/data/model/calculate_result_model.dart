class CalculateResultModel {
  int? totalPrice;

  CalculateResultModel({this.totalPrice});

  CalculateResultModel.fromJson(Map<String, dynamic> json) {
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_price'] = totalPrice;
    return data;
  }
}