import 'package:weather_forecast/data/models/location.dart';
import 'package:weather_forecast/data/repositories/i_weather_repository.dart';

class MainUseCase {
  final IWeatherRepository _weatherRepository;

  MainUseCase(
    this._weatherRepository,
  );

  Future<String> getCity(Location location) async {
    final object = await _weatherRepository.getCity(location);
    return object.city.name;
  }
}
