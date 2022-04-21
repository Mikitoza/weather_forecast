import 'package:weather_forecast/data/datasources/remote_data_source.dart';
import 'package:weather_forecast/data/models/api_object.dart';
import 'package:weather_forecast/data/models/location.dart';

class WeatherRepository{
  final RemoteDataSource _remoteDataSource;

  WeatherRepository(this._remoteDataSource);

  Future<ApiObject> getCity(Location location) async {
    return _remoteDataSource.getWeathersList(location);
  }
}
