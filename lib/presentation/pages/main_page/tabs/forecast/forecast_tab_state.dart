import 'package:equatable/equatable.dart';
import 'package:weather_forecast/domain/entities/forecast_tile.dart';

enum ForecastTabStateStatus { initial, success, error, loading }

extension ForecastTabStateStatusX on ForecastTabStateStatus {
  bool get isInitial => this == ForecastTabStateStatus.initial;
  bool get isSuccess => this == ForecastTabStateStatus.success;
  bool get isError => this == ForecastTabStateStatus.error;
  bool get isLoading => this == ForecastTabStateStatus.loading;
}

class ForecastTabState extends Equatable {
  final List<ForecastTile> forecast;
  final ForecastTabStateStatus status;
  final String errorDesc;

  const ForecastTabState({
    this.forecast = const <ForecastTile>[],
    this.status = ForecastTabStateStatus.initial,
    this.errorDesc = '',
  });

  ForecastTabState copyWith({
    List<ForecastTile>? forecast,
    ForecastTabStateStatus? status,
    String? errorDesc,
  }) {
    return ForecastTabState(
      forecast: forecast ?? this.forecast,
      status: status ?? this.status,
      errorDesc: errorDesc ?? this.errorDesc,
    );
  }

  @override
  List<Object?> get props => [
        forecast,
        status,
        errorDesc,
      ];
}
