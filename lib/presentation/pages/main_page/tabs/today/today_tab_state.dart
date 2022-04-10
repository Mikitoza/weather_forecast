import 'package:equatable/equatable.dart';

class TodayTabState extends Equatable {
  final String city;
  final String temperature;
  final String pop;
  final String volume;
  final String pressure;
  final String windSpeed;
  final String windDirection;

  const TodayTabState({
    required this.city,
    required this.temperature,
    required this.pop,
    required this.volume,
    required this.pressure,
    required this.windSpeed,
    required this.windDirection,
  });

  TodayTabState copyWith(
    String? city,
    String? temperature,
    String? pop,
    String? volume,
    String? pressure,
    String? windSpeed,
    String? windDirection,
  ) {
    return TodayTabState(
      city: city ?? this.city,
      temperature: temperature ?? this.temperature,
      pop: pop ?? this.pop,
      volume: volume ?? this.volume,
      pressure: pressure ?? this.pressure,
      windSpeed: windSpeed ?? this.windSpeed,
      windDirection: windDirection ?? this.windDirection,
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
      ];
}
