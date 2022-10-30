import 'package:pet_service/core/network/api_request.dart';
import 'package:pet_service/service_cost/domain/entities/pet_service_cost.dart';

class GetCostAPIRequest extends APIRequest<PetServiceCost> {

  @override
   prepareRequest(PetServiceCost model) {
    return {
      "dog": {
        "services": {
          "grooming": model.isDogGrooming,
          "hotel": {"nights": model.dogNights}
        }
      },
      "cat": {
        "services": {
          "grooming": model.isCatGrooming,
          "hotel": {"nights": model.catNights}
        }
      }
    };
  }
}
