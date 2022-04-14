import 'package:weather_forecast/domain/entities/forecast_tile.dart';

class ForecastTabState {
  final List<ForecastTile> forecast;

  ForecastTabState({
    required this.forecast,
  });

  ForecastTabState copyWith({
    List<ForecastTile>? forecast,
  }) {
    return ForecastTabState(
      forecast: forecast ?? this.forecast,
    );
  }
}
