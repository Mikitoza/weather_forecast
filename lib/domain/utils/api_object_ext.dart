import 'package:weather_forecast/data/models/api_object.dart';
import 'package:weather_forecast/domain/entities/forecast_tile.dart';
import 'package:weather_forecast/domain/entities/weather.dart';
import 'package:weather_forecast/domain/utils/double_ext.dart';

extension ApiObjectToWeater on ApiObject {
  Weather parseItemToToday() {
    return Weather(
      city: city.name,
      rain: weathers.first.rain?.threeHours ?? weathers.first.snow?.threeHours,
      pop: (weathers.first.pop * 100).toInt(),
      main: weathers.first.weather.main,
      pressure: weathers.first.main.pressure,
      windDirection: weathers.first.wind.deg.getDirection(),
      windSpeed: weathers.first.wind.speed.toInt(),
      temperature: weathers.first.main.temp.toInt(),
      country: city.country,
      icon: weathers.first.weather.icon,
    );
  }

  List<ForecastTile> parseItemToList() {
    final List<ForecastTile> forecast = [];
    for (var weatherItem in weathers) {
      forecast.add(
        ForecastTile(
          temperature: weatherItem.main.temp.toInt(),
          desc: weatherItem.weather.description,
          icon: weatherItem.weather.icon,
          time: DateTime.fromMillisecondsSinceEpoch(weatherItem.dt * 1000),
        ),
      );
    }
    return forecast;
  }
}
