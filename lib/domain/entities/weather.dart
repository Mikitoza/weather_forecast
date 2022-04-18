class Weather {
  final String city;
  final String country;
  final int temperature;
  final int pop;
  final double? rain;
  final String main;
  final int pressure;
  final int windSpeed;
  final String windDirection;
  final String icon;

  const Weather({
    required this.city,
    required this.pop,
    required this.main,
    required this.pressure,
    required this.windDirection,
    required this.windSpeed,
    required this.temperature,
    required this.country,
    required this.icon,
    this.rain,
  });
}
