import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

class WeatherTheme extends Equatable {
  final Color primaryColor;
  final Color accentColor;
  final Color primaryBackgroundColor;
  final Color primaryTextColor;
  final Color accentTextColor;
  final Color actionTextColor;
  final Color dividerColor;
  final TextStyle primaryTextStyle;
  final TextStyle primaryItalicTextStyle;
  final TextStyle appbarTextStyle;
  final TextStyle accentTextStyle;
  final TextStyle actionTextStyle;

  const WeatherTheme({
    required this.primaryColor,
    required this.accentColor,
    required this.primaryBackgroundColor,
    required this.primaryTextColor,
    required this.accentTextColor,
    required this.actionTextColor,
    required this.dividerColor,
    required this.primaryTextStyle,
    required this.primaryItalicTextStyle,
    required this.appbarTextStyle,
    required this.accentTextStyle,
    required this.actionTextStyle,
  });

  @override
  List<Object?> get props => [
        primaryColor,
        accentColor,
        primaryBackgroundColor,
        dividerColor,
        primaryTextColor,
        accentTextColor,
        actionTextColor,
        primaryTextStyle,
        appbarTextStyle,
        accentTextStyle,
        actionTextStyle,
      ];
}
