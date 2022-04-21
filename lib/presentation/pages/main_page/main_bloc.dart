import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/domain/usecases/main_usecase.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_event.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainUseCase _mainUseCase;

  MainBloc(
    this._mainUseCase,
  ) : super(const MainState()) {
    on<MainChangeTabEvent>(
      _onChangeTab,
    );
    on<MainCheckNetworkEvent>(
      _onCheckNetwork,
    );
  }

  Future<void> _onChangeTab(
    MainChangeTabEvent event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(status: MainStateStatus.loading));
    if (event.index == 0) {
      emit(
        state.copyWith(
          title: 'Today',
          pageIndex: event.index,
          status: MainStateStatus.success,
        ),
      );
    } else {
      final location = await _mainUseCase.getCurrentLocation();
      if (location == null) {
        emit(
          state.copyWith(
            status: MainStateStatus.error,
            errorDesc: 'Location error',
            pageIndex: event.index,
          ),
        );
      } else {
        try {
          emit(
            state.copyWith(
              pageIndex: event.index,
              title: await _mainUseCase.getCity(location),
              status: MainStateStatus.success,
            ),
          );
        } catch (_) {
          emit(
            state.copyWith(
              pageIndex: event.index,
              errorDesc: 'Some problems \nPlease, restart the app or check connection',
              status: MainStateStatus.error,
            ),
          );
        }
      }
    }
  }

  Future<void> _onCheckNetwork(
    MainCheckNetworkEvent event,
    Emitter<MainState> emit,
  ) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      result.isNotEmpty && result[0].rawAddress.isNotEmpty
          ? null
          : emit(
              state.copyWith(
                status: MainStateStatus.error,
                errorDesc: 'No connection',
              ),
            );
    } on SocketException catch (_) {
      emit(
        state.copyWith(
          status: MainStateStatus.error,
          errorDesc: 'No connection',
        ),
      );
    }
  }
}
