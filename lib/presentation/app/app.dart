import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/domain/entities/theme_type.dart';
import 'package:weather_forecast/presentation/app/app_cubit.dart';
import 'package:weather_forecast/presentation/app/app_state.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_page.dart';
import 'package:weather_forecast/presentation/theme/theme_provider.dart';
import 'package:weather_forecast/presentation/theme/themes.dart';
///TODO:Think about navigation
class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return ThemeProvider(
          theme: state.themeType == ThemeType.dark ? darkTheme : lightTheme,
          child: Builder(
            builder: (context) {
              return const MainPage();
            },
          ),
        );
      },
    );
  }
}
