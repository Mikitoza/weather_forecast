import 'package:equatable/equatable.dart';
import 'package:weather_forecast/domain/entities/main_page_tabs.dart';

class MainState extends Equatable {
  final String title;
  final MainPageTab tab;

  const MainState({
    required this.title,
    required this.tab,
  });

  MainState copyWith({
    String? title,
    MainPageTab? tab,
  }) {
    return MainState(
      title: title ?? this.title,
      tab: tab ?? this.tab,
    );
  }

  @override
  List<Object?> get props => [
        title,
        tab,
      ];
}
