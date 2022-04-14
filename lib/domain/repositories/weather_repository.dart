import 'package:weather_forecast/data/datasources/interfaces/i_remote_data_sources.dart';
import 'package:weather_forecast/data/models/api_object.dart';
import 'package:weather_forecast/data/models/location.dart';
import 'package:weather_forecast/data/repositories/i_weather_repository.dart';

class WeatherRepository implements IWeatherRepository {
  final IRemoteDataSource _remoteDataSource;

  WeatherRepository(this._remoteDataSource);

  @override
  Future<ApiObject> getCity(Location location) async {
    return _remoteDataSource.getWeathersList(location);
  }
}
