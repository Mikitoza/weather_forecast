import 'package:get_it/get_it.dart';
import 'package:weather_forecast/data/datasources/remote_data_source.dart';
import 'package:weather_forecast/data/platfrom_client/location_client.dart';
import 'package:weather_forecast/domain/repositories/weather_repository.dart';
import 'package:weather_forecast/domain/usecases/forecast_usecase.dart';
import 'package:weather_forecast/domain/usecases/main_usecase.dart';
import 'package:weather_forecast/domain/usecases/today_usecase.dart';
import 'package:weather_forecast/presentation/app/app_bloc.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_bloc.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/forecast/forecast_tab_bloc.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_bloc.dart';

final locator = GetIt.instance;

void setUp() {
  _setUpDataSources();
  _setUpPlatform();
  _setUpRepositories();
  _setUpUseCases();
  _setUpBlocs();
}

void _setUpDataSources() {
  locator.registerFactory<RemoteDataSource>(
    () => RemoteDataSource(),
  );
}

void _setUpPlatform() {
  locator.registerFactory<LocationClient>(
    () => LocationClient(),
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
      locator.get<LocationClient>(),
    ),
  );
  locator.registerFactory<TodayUseCase>(
    () => TodayUseCase(
      locator.get<WeatherRepository>(),
      locator.get<LocationClient>(),
    ),
  );
  locator.registerFactory<ForecastUseCase>(
    () => ForecastUseCase(
      locator.get<WeatherRepository>(),
      locator.get<LocationClient>(),
    ),
  );
}

void _setUpBlocs() {
  locator.registerFactory<MainBloc>(
    () => MainBloc(
      locator.get(),
    ),
  );
  locator.registerFactory<AppBloc>(
    () => AppBloc(),
  );
  locator.registerFactory<TodayTabBloc>(
    () => TodayTabBloc(
      locator.get<TodayUseCase>(),
    ),
  );
  locator.registerFactory<ForecastTabBloc>(
    () => ForecastTabBloc(
      locator.get<ForecastUseCase>(),
    ),
  );
}
