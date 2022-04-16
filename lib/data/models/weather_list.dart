import 'package:weather_forecast/data/models/main_model.dart';
import 'package:weather_forecast/data/models/weather_model.dart';

class WeatherListItem {
  final int dt;
  final Main main;
  final WeatherModel weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Rain? rain;
  final Snow? snow;
  final Sys sys;
  final String dtTxt;

  const WeatherListItem({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
    this.rain,
    this.snow,
  });

  factory WeatherListItem.fromJson(Map<String, dynamic> json) => WeatherListItem(
        dt: json['dt'],
        main: Main.fromJson(json['main']),
        weather: json['weather'].map((weather) => WeatherModel.fromJson(weather)).first,
        clouds: Clouds.fromJson(json['clouds']),
        wind: Wind.fromJson(json['wind']),
        visibility: json['visibility'],
        pop: json['pop'].toDouble(),
        rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
        sys: Sys.fromJson(json['sys']),
        dtTxt: json['dt_txt'],
      );
}

class Clouds {
  final int all;

  const Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(all: json['all']);
}

class Wind {
  final double speed;
  final double deg;
  final double gust;

  const Wind({
    required this.deg,
    required this.gust,
    required this.speed,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        deg: json['deg'].toDouble(),
        gust: json['gust'].toDouble(),
        speed: json['speed'].toDouble(),
      );
}

class Rain {
  final double threeHours;

  const Rain({
    required this.threeHours,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(threeHours: json['3h']);
}

class Snow {
  final String threeHours;

  const Snow({
    required this.threeHours,
  });

  Snow.fromJson(Map<String, dynamic> json) : threeHours = json['3h'];
}

class Sys {
  final String pod;

  const Sys({
    required this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(pod: json['pod']);
}
