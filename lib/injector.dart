import 'package:get_it/get_it.dart';
import 'package:weather_forecast/presentation/app/app_cubit.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_cubit.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_cubit.dart';

final locator = GetIt.instance;

void setUp() {
  _setUpCubits();
}

void _setUpCubits() {
  locator.registerFactory<MainCubit>(
    () => MainCubit(),
  );
  locator.registerFactory<AppCubit>(
    () => AppCubit(),
  );
  locator.registerFactory<TodayTabCubit>(
    () => TodayTabCubit(),
  );
}
