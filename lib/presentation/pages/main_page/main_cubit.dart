import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/data/models/location.dart';
import 'package:weather_forecast/domain/entities/main_page_tabs.dart';
import 'package:weather_forecast/domain/usecases/main_usecase.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainUseCase _mainUseCase;

  MainCubit(
    this._mainUseCase,
  ) : super(
          const MainState(
            title: 'Today',
            tab: MainPageTab.today,
          ),
        );

  void setTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void setTab(int index) {
    switch (index) {
      case 0:
        emit(state.copyWith(tab: MainPageTab.today));
        break;
      case 1:
        emit(state.copyWith(tab: MainPageTab.forecast));
        break;
    }
  }

  void setCity() async {
    emit(
      state.copyWith(
        title: await _mainUseCase.getCity(
          Location(lat: 51.509865, lon: -0.118092),
        ),
      ),
    );
  }
}
