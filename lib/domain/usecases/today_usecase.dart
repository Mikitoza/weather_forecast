import 'package:weather_forecast/data/models/location.dart';
import 'package:weather_forecast/data/repositories/i_weather_repository.dart';
import 'package:weather_forecast/domain/entities/weather.dart';
import 'package:weather_forecast/domain/utils/weather_ext.dart';

class TodayUseCase {
  final IWeatherRepository _weatherRepository;

  TodayUseCase(
    this._weatherRepository,
  );

  Future<Weather> getTodayWeather(Location location) async {
    final object = await _weatherRepository.getCity(location);
    return object.parseItemToToday();
  }
}
