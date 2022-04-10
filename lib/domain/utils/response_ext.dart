import 'package:dio/dio.dart';

extension ResponseTo on Response {
  bool isSuccessful() => statusCode == 200 || statusCode == 201 || statusCode == 204;

  T retrieveResult<T>() {
    T result;
    if (isSuccessful()) {
      result = _createFromJSON<T>(data)!;
      return result;
    }
    throw Exception('Ошибка: $statusCode \n Код ошибки: $statusCode');
  }
}
