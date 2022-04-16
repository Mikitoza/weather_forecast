import 'package:equatable/equatable.dart';

class TodayTabState extends Equatable {
  final String city;
  final String country;
  final String main;
  final int temperature;
  final int pop;
  final double volume;
  final int pressure;
  final int windSpeed;
  final String windDirection;
  final bool isError;

  const TodayTabState({
    required this.city,
    required this.country,
    required this.main,
    required this.temperature,
    required this.pop,
    required this.volume,
    required this.pressure,
    required this.windSpeed,
    required this.windDirection,
    required this.isError,
  });

  TodayTabState copyWith({
    String? city,
    String? country,
    String? main,
    int? temperature,
    int? pop,
    double? volume,
    int? pressure,
    int? windSpeed,
    String? windDirection,
    bool? isError,
  }) {
    return TodayTabState(
      city: city ?? this.city,
      country: country ?? this.country,
      main: main ?? this.main,
      temperature: temperature ?? this.temperature,
      pop: pop ?? this.pop,
      volume: volume ?? this.volume,
      pressure: pressure ?? this.pressure,
      windSpeed: windSpeed ?? this.windSpeed,
      windDirection: windDirection ?? this.windDirection,
      isError: isError ?? this.isError,
    );
  }

  @override
  List<Object?> get props => [
        city,
        temperature,
        pop,
        volume,
        pressure,
        windSpeed,
        windDirection,
        isError,
      ];
}
