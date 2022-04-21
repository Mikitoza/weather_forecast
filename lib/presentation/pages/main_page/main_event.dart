import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MainChangeTabEvent extends MainEvent {
  final int index;

  MainChangeTabEvent(
    this.index,
  );
}

class MainCheckNetworkEvent extends MainEvent {}
