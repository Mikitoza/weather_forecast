import 'package:equatable/equatable.dart';

abstract class TodayTabEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodayTabInitializeEvent extends TodayTabEvent {}
