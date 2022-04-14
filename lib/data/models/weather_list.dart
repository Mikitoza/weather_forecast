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
        sys: Sys.fromJson(json['sys']),
        dtTxt: json['dt_txt'],
      );
}

class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int groundLevel;
  final int humidity;
  final double tempKf;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.groundLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json['temp'],
        feelsLike: json['feels_like'].toDouble(),
        tempMin: json['temp_min'],
        tempMax: json['temp_max'],
        pressure: json['pressure'],
        seaLevel: json['sea_level'],
        groundLevel: json['grnd_level'],
        humidity: json['humidity'],
        tempKf: json['temp_kf'].toDouble(),
      );
}

class WeatherModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  const WeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
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
  final int deg;
  final double gust;

  const Wind({
    required this.deg,
    required this.gust,
    required this.speed,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        deg: json['deg'],
        gust: json['gust'].toDouble(),
        speed: json['speed'],
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
