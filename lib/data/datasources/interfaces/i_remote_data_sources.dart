import 'package:weather_forecast/data/models/api_object.dart';
import 'package:weather_forecast/domain/entities/location.dart';

abstract class IRemoteDataSource{
  Future<> getWeather(Location location);
}