import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/domain/entities/theme_type.dart';
import 'package:weather_forecast/presentation/app/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          const AppState(themeType: ThemeType.light),
        );

  Brightness get _platformBrightness =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
          .platformBrightness;

  void onAppStarted() {
    emit(
      state.newState(
        themeType: _platformBrightness == Brightness.light
            ? ThemeType.light
            : ThemeType.dark,
      ),
    );
  }
}
