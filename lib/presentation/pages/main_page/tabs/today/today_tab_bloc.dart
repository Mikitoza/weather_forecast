import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/domain/usecases/today_usecase.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_event.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_state.dart';

class TodayTabBloc extends Bloc<TodayTabEvent, TodayTabState> {
  final TodayUseCase _todayUseCase;

  TodayTabBloc(
    this._todayUseCase,
  ) : super(const TodayTabState()) {
    on<TodayTabInitializeEvent>(
      _onInitialize,
    );
  }

  Future<void> _onInitialize(
    TodayTabInitializeEvent event,
    Emitter<TodayTabState> emit,
  ) async {
    emit(state.copyWith(status: TodayTabStateStatus.loading));
    final location = await _todayUseCase.getCurrentLocation();
    if (location == null) {
      emit(
        state.copyWith(
          status: TodayTabStateStatus.error,
          errorDesc: 'Location error',
        ),
      );
    } else {
      try {
        final weather = await _todayUseCase.getTodayWeather((location));
        emit(
          state.copyWith(
            city: weather.city,
            country: weather.country,
            main: weather.main,
            temperature: weather.temperature,
            pop: weather.pop,
            volume: weather.rain,
            pressure: weather.pressure,
            windSpeed: weather.windSpeed,
            windDirection: weather.windDirection,
            icon: weather.icon,
            status: TodayTabStateStatus.success,
          ),
        );
      } on SocketException catch (_) {
        state.copyWith(
          errorDesc: 'Some problems \nPlease, restart the app or check connection',
          status: TodayTabStateStatus.error,
        );
      }
    }
  }
}
