import 'package:equatable/equatable.dart';

class MainState extends Equatable {
  final String title;
  final int pageIndex;

  const MainState({
    required this.title,
    required this.pageIndex,
  });

  MainState copyWith({
    String? title,
    int? pageIndex,
  }) {
    return MainState(
      title: title ?? this.title,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  List<Object?> get props => [
        title,
    pageIndex,
      ];
}
