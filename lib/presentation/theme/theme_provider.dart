import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/theme/weather_theme.dart';

class ThemeProvider extends InheritedWidget {
  final WeatherTheme theme;

  const ThemeProvider({
    Key? key,
    required Widget child,
    required this.theme,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) => theme != oldWidget.theme;

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }
}
