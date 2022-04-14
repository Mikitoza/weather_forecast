class ForecastTile {
  final String icon;
  final String desc;
  final DateTime time;
  final int temperature;

  ForecastTile({
    required this.temperature,
    required this.desc,
    required this.icon,
    required this.time,
  });
}
