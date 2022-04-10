import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_state.dart';

class TodayTabCubit extends Cubit<TodayTabState> {
  TodayTabCubit()
      : super(
          const TodayTabState(
            city: 'London, UK',
            temperature: '22 °C | Sunny',
            pop: '55%',
            volume: '1.0 mm',
            pressure: '1019 hPa',
            windSpeed: '20 km/h',
            windDirection: 'SE',
          ),
        );
}
