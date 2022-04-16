import 'package:weather_forecast/data/models/location.dart';
import 'package:weather_forecast/data/platfrom_client/interfaces/i_location_client.dart';
import 'package:weather_forecast/data/repositories/i_weather_repository.dart';
import 'package:weather_forecast/domain/entities/forecast_tile.dart';
import 'package:weather_forecast/domain/utils/api_object_ext.dart';

class ForecastUseCase {
  final IWeatherRepository _weatherRepository;
  final ILocationClient _locationClient;

  ForecastUseCase(
    this._weatherRepository,
    this._locationClient,
  );

  Future<List<ForecastTile>> getForecast(Location location) async {
    final object = await _weatherRepository.getCity(location);
    return object.parseItemToList();
  }

  Future<Location?> getCurrentLocation() => _locationClient.getCurrentLocation();
}
