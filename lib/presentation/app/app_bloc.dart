import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/domain/entities/theme_type.dart';
import 'package:weather_forecast/presentation/app/app_event.dart';
import 'package:weather_forecast/presentation/app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState(themeType: ThemeType.light)) {
    on<AppInitializeEvent>(
      _onInitialize,
    );
  }

  Brightness get _platformBrightness =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).platformBrightness;

  Future<void> _onInitialize(
    AppInitializeEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(
      state.newState(
        themeType: _platformBrightness == Brightness.light ? ThemeType.light : ThemeType.dark,
      ),
    );
  }
}
