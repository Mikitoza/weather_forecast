import 'package:equatable/equatable.dart';

abstract class ForecastTabEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForecastTabInitializeEvent extends ForecastTabEvent {}
