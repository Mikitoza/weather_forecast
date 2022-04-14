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