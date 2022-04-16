import 'package:equatable/equatable.dart';

class MainState extends Equatable {
  final String title;
  final int pageIndex;
  final bool isError;

  const MainState({
    required this.title,
    required this.pageIndex,
    required this.isError,
  });

  MainState copyWith({
    String? title,
    int? pageIndex,
    bool? isError,
  }) {
    return MainState(
      title: title ?? this.title,
      pageIndex: pageIndex ?? this.pageIndex,
      isError: isError ?? this.isError,
    );
  }

  @override
  List<Object?> get props => [
        title,
        pageIndex,
        isError,
      ];
}
