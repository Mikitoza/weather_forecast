import 'package:get_it/get_it.dart';
import 'package:weather_forecast/data/datasources/remote_data_source.dart';
import 'package:weather_forecast/domain/repositories/weather_repository.dart';
import 'package:weather_forecast/domain/usecases/forecast_usecase.dart';
import 'package:weather_forecast/domain/usecases/main_usecase.dart';
import 'package:weather_forecast/domain/usecases/today_usecase.dart';
import 'package:weather_forecast/presentation/app/app_cubit.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_cubit.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/forecast/forecast_tab_cubit.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_cubit.dart';

final locator = GetIt.instance;

void setUp() {
  _setUpDataSources();
  _setUpRepositories();
  _setUpUseCases();
  _setUpCubits();
}

void _setUpDataSources() {
  locator.registerFactory<RemoteDataSource>(
    () => RemoteDataSource(),
  );
}

void _setUpRepositories() {
  locator.registerFactory<WeatherRepository>(
    () => WeatherRepository(
      locator.get<RemoteDataSource>(),
    ),
  );
}

void _setUpUseCases() {
  locator.registerFactory<MainUseCase>(
    () => MainUseCase(
      locator.get<WeatherRepository>(),
    ),
  );
  locator.registerFactory<TodayUseCase>(
    () => TodayUseCase(
      locator.get<WeatherRepository>(),
    ),
  );
  locator.registerFactory<ForecastUseCase>(
    () => ForecastUseCase(
      locator.get<WeatherRepository>(),
    ),
  );
}

void _setUpCubits() {
  locator.registerFactory<MainCubit>(
    () => MainCubit(
      locator.get(),
    ),
  );
  locator.registerFactory<AppCubit>(
    () => AppCubit(),
  );
  locator.registerFactory<TodayTabCubit>(
    () => TodayTabCubit(
      locator.get<TodayUseCase>(),
    ),
  );
  locator.registerFactory<ForecastTabCubit>(
    () => ForecastTabCubit(
      locator.get<ForecastUseCase>(),
    ),
  );
}
