import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/domain/usecases/forecast_usecase.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/forecast/forecast_tab_event.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/forecast/forecast_tab_state.dart';

class ForecastTabBloc extends Bloc<ForecastTabEvent, ForecastTabState> {
  final ForecastUseCase _forecastUseCase;

  ForecastTabBloc(
    this._forecastUseCase,
  ) : super(const ForecastTabState()) {
    on<ForecastTabInitializeEvent>(
      _onInitialize,
    );
  }

  Future<void> _onInitialize(
    ForecastTabInitializeEvent event,
    Emitter<ForecastTabState> emit,
  ) async {
    emit(state.copyWith(status: ForecastTabStateStatus.loading));
    final location = await _forecastUseCase.getCurrentLocation();
    if (location == null) {
      emit(
        state.copyWith(
          status: ForecastTabStateStatus.error,
          errorDesc: 'Location error',
        ),
      );
    } else {
      try {
        emit(
          state.copyWith(
            forecast: await _forecastUseCase.getForecast(location),
            status: ForecastTabStateStatus.success,
          ),
        );
      } on SocketException catch (_) {
        emit(
          state.copyWith(
            status: ForecastTabStateStatus.error,
            errorDesc: 'Some problems \nPlease, restart the app or check connection',
          ),
        );
      }
    }
  }
}
