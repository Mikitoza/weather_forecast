import 'package:weather_forecast/data/models/api_object.dart';
import 'package:weather_forecast/data/models/location.dart';

abstract class IWeatherRepository {
  Future<ApiObject> getCity(Location location);
}
