import 'package:equatable/equatable.dart';
import 'package:weather_forecast/domain/entities/theme_type.dart';

class AppState extends Equatable {
  final ThemeType themeType;

  const AppState({
    required this.themeType,
  });

  AppState newState({ThemeType? themeType}) {
    return AppState(
      themeType: themeType ?? this.themeType,
    );
  }

  @override
  List<Object?> get props => [themeType];
}
