import 'package:equatable/equatable.dart';
import 'package:weather_forecast/domain/entities/theme_type.dart';

enum AppStateStatus { initial, success, error, loading }

extension AppStateStatusX on AppStateStatus {
  bool get isInitial => this == AppStateStatus.initial;
  bool get isSuccess => this == AppStateStatus.success;
  bool get isError => this == AppStateStatus.error;
  bool get isLoading => this == AppStateStatus.loading;
}

class AppState extends Equatable {
  final ThemeType themeType;
  final AppStateStatus status;

  const AppState({
    this.themeType = ThemeType.light,
    this.status = AppStateStatus.initial,
  });

  AppState newState({
    ThemeType? themeType,
    AppStateStatus? status,
  }) {
    return AppState(
      themeType: themeType ?? this.themeType,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        themeType,
        status,
      ];
}
