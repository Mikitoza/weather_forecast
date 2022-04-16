import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/domain/usecases/main_usecase.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainUseCase _mainUseCase;

  MainCubit(
    this._mainUseCase,
  ) : super(
          const MainState(
            title: 'Today',
            pageIndex: 0,
            isError: false,
          ),
        );

  void setTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void setTab(int index) {
    emit(state.copyWith(pageIndex: index));
  }

  void setCity() async {
    final location = await _mainUseCase.getCurrentLocation();
    if (location == null) {
      changeIsError(true);
    } else {
      emit(state.copyWith(title: await _mainUseCase.getCity(location)));
    }
  }

  void changeIsError(bool isError) {
    emit(state.copyWith(isError: isError));
  }
}
