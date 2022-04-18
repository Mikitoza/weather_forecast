import 'package:weather_forecast/domain/entities/forecast_tile.dart';

class ForecastTabState {
  final List<ForecastTile> forecast;
  final bool isError;
  final bool isLoading;

  ForecastTabState({
    required this.forecast,
    required this.isError,
    required this.isLoading,
  });

  ForecastTabState copyWith({
    List<ForecastTile>? forecast,
    bool? isError,
    bool? isLoading,
  }) {
    return ForecastTabState(
      forecast: forecast ?? this.forecast,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
