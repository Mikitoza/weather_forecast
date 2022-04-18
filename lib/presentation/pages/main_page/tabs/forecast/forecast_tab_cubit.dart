import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/domain/usecases/forecast_usecase.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/forecast/forecast_tab_state.dart';

class ForecastTabCubit extends Cubit<ForecastTabState> {
  final ForecastUseCase _forecastUseCase;

  ForecastTabCubit(
    this._forecastUseCase,
  ) : super(
          ForecastTabState(
            forecast: [],
            isError: false,
            isLoading: true,
          ),
        );

  void init() async {
    final location = await _forecastUseCase.getCurrentLocation();
    if (location == null) {
      changeIsError(true);
    } else {
      emit(state.copyWith(
        forecast: await _forecastUseCase.getForecast(location),
        isLoading: false,
      ));
    }
  }

  void changeIsError(bool isError) {
    emit(state.copyWith(isError: isError));
  }
}
