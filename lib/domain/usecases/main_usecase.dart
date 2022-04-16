import 'package:weather_forecast/data/models/location.dart';
import 'package:weather_forecast/data/platfrom_client/interfaces/i_location_client.dart';
import 'package:weather_forecast/data/repositories/i_weather_repository.dart';

class MainUseCase {
  final IWeatherRepository _weatherRepository;
  final ILocationClient _locationClient;

  MainUseCase(
    this._weatherRepository,
    this._locationClient,
  );

  Future<String> getCity(Location location) async {
    final object = await _weatherRepository.getCity(location);
    return object.city.name;
  }

  Future<Location?> getCurrentLocation() => _locationClient.getCurrentLocation();
}
