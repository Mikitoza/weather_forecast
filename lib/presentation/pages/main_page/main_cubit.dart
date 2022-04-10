import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/domain/entities/main_page_tabs.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit()
      : super(
          const MainState(
            title: '',
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
}
