import 'package:equatable/equatable.dart';
import 'package:weather_forecast/data/models/location.dart';

class CityModel extends Equatable {
  final int id;
  final String name;
  final Location coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  const CityModel({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json['id'],
        name: json['name'],
        coord: Location.fromJson(json['coord']),
        country: json['country'],
        population: json['population'],
        timezone: json['timezone'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        coord,
        country,
        population,
        timezone,
        sunrise,
        sunset,
      ];
}
