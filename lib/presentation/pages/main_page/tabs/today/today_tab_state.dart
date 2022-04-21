import 'package:equatable/equatable.dart';

enum TodayTabStateStatus { initial, success, error, loading }

extension TodayTabStateStatusX on TodayTabStateStatus {
  bool get isInitial => this == TodayTabStateStatus.initial;
  bool get isSuccess => this == TodayTabStateStatus.success;
  bool get isError => this == TodayTabStateStatus.error;
  bool get isLoading => this == TodayTabStateStatus.loading;
}

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
  final String icon;
  final TodayTabStateStatus status;
  final String errorDesc;

  const TodayTabState({
    this.city = '',
    this.country = '',
    this.main = '',
    this.temperature = 0,
    this.pop = 0,
    this.volume = 0.0,
    this.pressure = 0,
    this.windSpeed = 0,
    this.windDirection = 'SE',
    this.icon = '01d',
    this.status = TodayTabStateStatus.initial,
    this.errorDesc = '',
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
    String? icon,
    TodayTabStateStatus? status,
    String? errorDesc,
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
      icon: icon ?? this.icon,
      status: status ?? this.status,
      errorDesc: errorDesc ?? this.errorDesc,
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
        status,
        errorDesc,
      ];
}
