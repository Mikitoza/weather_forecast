import 'package:weather_forecast/data/models/weather_list.dart';

import 'city_model.dart';

class ApiObject {
  final List<WeatherListItem> weathers;
  final CityModel city;

  const ApiObject({
    required this.weathers,
    required this.city,
  });

  factory ApiObject.fromJson(Map<String, dynamic> json) => ApiObject(
        city: CityModel.fromJson(json['city']),
        weathers: (json['list'] as List)
            .map((weatherItem) => WeatherListItem.fromJson(weatherItem))
            .toList(),
      );
}
