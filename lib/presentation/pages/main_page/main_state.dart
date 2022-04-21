import 'package:equatable/equatable.dart';

enum MainStateStatus { initial, success, error, loading }

extension MainStateStatusX on MainStateStatus {
  bool get isInitial => this == MainStateStatus.initial;
  bool get isSuccess => this == MainStateStatus.success;
  bool get isError => this == MainStateStatus.error;
  bool get isLoading => this == MainStateStatus.loading;
}

class MainState extends Equatable {
  final String title;
  final int pageIndex;
  final MainStateStatus status;
  final String errorDesc;

  const MainState({
    this.title = 'Today',
    this.pageIndex = 0,
    this.errorDesc = '',
    this.status = MainStateStatus.initial,
  });

  MainState copyWith({
    String? title,
    int? pageIndex,
    MainStateStatus? status,
    String? errorDesc,
  }) {
    return MainState(
      title: title ?? this.title,
      pageIndex: pageIndex ?? this.pageIndex,
      status: status ?? this.status,
      errorDesc: errorDesc ?? this.errorDesc,
    );
  }

  @override
  List<Object?> get props => [
        title,
        pageIndex,
        status,
        errorDesc,
      ];
}
