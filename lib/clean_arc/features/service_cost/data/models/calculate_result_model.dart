import 'package:pet_service/clean_arc/features/service_cost/domain/entities/cost.dart';

class CostModel extends Cost{

  CostModel({totalPrice}) : super(totalPrice: totalPrice);

  CostModel.fromJson(Map<String, dynamic> json) {
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_price'] = totalPrice;
    return data;
  }
}