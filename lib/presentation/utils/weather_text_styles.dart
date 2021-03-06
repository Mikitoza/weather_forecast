import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/utils/weather_dimens.dart';

abstract class WeatherTextStyles {
  static TextStyle base({required Color textColor, double? fontSize}) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize ?? WeatherDimens.sizeXL,
    );
  }

  static TextStyle appbar({required Color textColor, double? fontSize, FontWeight? fontWeight}) {
    return base(textColor: textColor).copyWith(
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
}
