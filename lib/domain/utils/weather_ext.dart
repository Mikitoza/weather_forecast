import 'package:weather_forecast/data/models/api_object.dart';
import 'package:weather_forecast/domain/entities/weather.dart';

extension ApiObjectToWeater on ApiObject {
  Weather parseItemToToday() {
    return Weather(
      city: city.name,
      rain: weathers.first.rain?.threeHours,
      pop: weathers.first.pop.toInt(),
      main: weathers.first.weather.main,
      pressure: weathers.first.main.pressure,
      windDirection: weathers.first.wind.deg.toString(),
      windSpeed: weathers.first.wind.speed.toInt(),
      temperature: weathers.first.main.temp.toInt(),
      country: city.country,
    );
  }
}
