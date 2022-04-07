import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

class WeatherTheme extends Equatable {
  final Color primaryColor;
  final Color accentColor;
  final Color primaryBackgroundColor;
  final Color primaryTextColor;
  final Color accentTextColor;
  final Color actionTextColor;
  final TextStyle primaryTextStyle;
  final TextStyle appbarTextStyle;
  final TextStyle accentTextStyle;

  const WeatherTheme({
    required this.primaryColor,
    required this.accentColor,
    required this.primaryBackgroundColor,
    required this.primaryTextColor,
    required this.accentTextColor,
    required this.actionTextColor,
    required this.primaryTextStyle,
    required this.appbarTextStyle,
    required this.accentTextStyle,
  });

  @override
  List<Object?> get props => [
        primaryColor,
        accentColor,
        primaryBackgroundColor,
        primaryTextColor,
        accentTextColor,
        actionTextColor,
        primaryTextStyle,
        appbarTextStyle,
        accentTextStyle,
      ];
}
