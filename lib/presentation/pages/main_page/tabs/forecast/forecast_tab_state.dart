import 'package:weather_forecast/domain/entities/forecast_tile.dart';

class ForecastTabState {
  final List<ForecastTile> forecast;
  final bool isError;

  ForecastTabState({
    required this.forecast,
    required this.isError,
  });

  ForecastTabState copyWith({
    List<ForecastTile>? forecast,
    bool? isError,
  }) {
    return ForecastTabState(
      forecast: forecast ?? this.forecast,
      isError: isError ?? this.isError,
    );
  }
}
