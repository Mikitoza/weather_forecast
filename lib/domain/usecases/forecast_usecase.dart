import 'package:weather_forecast/data/models/location.dart';
import 'package:weather_forecast/data/repositories/i_weather_repository.dart';
import 'package:weather_forecast/domain/entities/forecast_tile.dart';
import 'package:weather_forecast/domain/utils/api_object_ext.dart';

class ForecastUseCase {
  final IWeatherRepository _weatherRepository;

  ForecastUseCase(
      this._weatherRepository,
      );

  Future<List<ForecastTile>> getForecast(Location location) async {
    final object = await _weatherRepository.getCity(location);
    print(object.parseItemToList().length);
    return object.parseItemToList();
  }
}
