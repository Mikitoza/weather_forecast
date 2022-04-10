import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/utils/weather_dimens.dart';

abstract class WeatherTextStyles {
  static TextStyle base({required Color textColor, double? fontSize}) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize ?? WeatherDimens.sizeXL,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle appbar({required Color textColor, double? fontSize}) {
    return base(textColor: textColor).copyWith(
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      color: textColor,
    );
  }
}
