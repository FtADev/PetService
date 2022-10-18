import 'package:pet_service/service_cost/domain/entities/cost.dart';

class CostModel extends Cost{

  CostModel({totalPrice}) : super(totalPrice: totalPrice);

  factory CostModel.fromJson(Map<String, dynamic> json) => CostModel(
    totalPrice: json["total_price"],
  );

  Map<String, dynamic> toJson() => {
    "total_price": totalPrice,
  };
}