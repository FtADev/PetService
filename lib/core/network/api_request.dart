abstract class APIRequest<T> {
  Map<String, dynamic> prepareRequestToJson(T model);
}