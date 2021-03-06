import 'package:weather_forecast/data/models/location.dart';
import 'package:weather_forecast/data/platfrom_client/location_client.dart';
import 'package:weather_forecast/domain/repositories/weather_repository.dart';
import 'package:weather_forecast/domain/entities/weather.dart';
import 'package:weather_forecast/domain/utils/api_object_ext.dart';

class TodayUseCase {
  final WeatherRepository _weatherRepository;
  final LocationClient _locationClient;

  TodayUseCase(
    this._weatherRepository,
    this._locationClient,
  );

  Future<Weather> getTodayWeather(Location location) async {
    final object = await _weatherRepository.getCity(location);
    return object.parseItemToToday();
  }

  Future<Location?> getCurrentLocation() => _locationClient.getCurrentLocation();
}
