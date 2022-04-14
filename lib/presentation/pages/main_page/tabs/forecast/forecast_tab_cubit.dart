import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/data/models/location.dart';
import 'package:weather_forecast/domain/usecases/forecast_usecase.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/forecast/forecast_tab_state.dart';

class ForecastTabCubit extends Cubit<ForecastTabState> {
  final ForecastUseCase _forecastUseCase;

  ForecastTabCubit(
    this._forecastUseCase,
  ) : super(
          ForecastTabState(
            forecast: [],
          ),
        );

  void init() async {
    emit(
      state.copyWith(
        forecast: await _forecastUseCase.getForecast(
          Location(lat: 51.509865, lon: -0.118092),
        ),
      ),
    );
  }
}
