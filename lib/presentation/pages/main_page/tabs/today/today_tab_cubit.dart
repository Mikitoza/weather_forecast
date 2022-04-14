import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/data/models/location.dart';
import 'package:weather_forecast/domain/usecases/today_usecase.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_state.dart';

class TodayTabCubit extends Cubit<TodayTabState> {
  final TodayUseCase _todayUseCase;

  TodayTabCubit(
    this._todayUseCase,
  ) : super(
          const TodayTabState(
            city: '',
            country: '',
            main: '',
            temperature: 0,
            pop: 0,
            volume: 0.0,
            pressure: 0,
            windSpeed: 0,
            windDirection: 'SE',
          ),
        );

  void init(Location location) async {
    final weather = await _todayUseCase.getTodayWeather(location);
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
      ),
    );
  }
}
