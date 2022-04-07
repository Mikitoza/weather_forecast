import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/utils/weather_dimens.dart';

abstract class WeatherTextStyles {
  static TextStyle base({required Color textColor, double? fontSize}) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize ?? WeatherDimens.sizeM,
    );
  }

  static TextStyle appbar(Color textColor) {
    return base(textColor: textColor).copyWith(
      fontSize: WeatherDimens.sizeXL,
    );
  }
}
