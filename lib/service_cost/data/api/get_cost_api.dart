import 'package:pet_service/core/util/endpoints.dart';
import 'package:pet_service/core/network/api.dart';
import 'package:pet_service/service_cost/data/api/get_cost_api_request.dart';

class GetCostApi extends API {
  GetCostApi() : super(apiRequest: GetCostAPIRequest());

  @override
  String getUrl() => Endpoints.baseUrl;

  @override
  String getHttpMethod() => "post";

  @override
  Map<String, dynamic> getHeader() => {};



}