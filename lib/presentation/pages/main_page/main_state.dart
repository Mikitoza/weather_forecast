import 'package:equatable/equatable.dart';

class MainState extends Equatable {
  final String title;
  final int pageIndex;
  final bool isError;
  final bool isConnect;

  const MainState({
    required this.title,
    required this.pageIndex,
    required this.isError,
    required this.isConnect,
  });

  MainState copyWith({
    String? title,
    int? pageIndex,
    bool? isError,
    bool? isConnect,
  }) {
    return MainState(
      title: title ?? this.title,
      pageIndex: pageIndex ?? this.pageIndex,
      isError: isError ?? this.isError,
      isConnect: isConnect ?? this.isConnect,
    );
  }

  @override
  List<Object?> get props => [
        title,
        pageIndex,
        isError,
      ];
}
