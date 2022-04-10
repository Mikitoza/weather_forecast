import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/injector.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_cubit.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_state.dart';
import 'package:weather_forecast/presentation/theme/theme_provider.dart';
import 'package:weather_forecast/presentation/utils/weather_dimens.dart';
import 'package:weather_forecast/presentation/utils/weather_text_styles.dart';

class TodayTab extends StatefulWidget {
  const TodayTab({Key? key}) : super(key: key);

  @override
  State<TodayTab> createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> {
  final _cubit = locator.get<TodayTabCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayTabCubit, TodayTabState>(
      bloc: _cubit,
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
              child: Icon(
                Icons.wb_sunny_outlined,
                size: 120,
                color: ThemeProvider.of(context).theme.accentColor,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            ///TODO:Replace WeatherTextStyles to Theme
            Text(
              state.city,
              style: WeatherTextStyles.base(
                textColor: ThemeProvider.of(context).theme.primaryTextColor,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              state.temperature,
              style: WeatherTextStyles.appbar(
                textColor: ThemeProvider.of(context).theme.actionTextColor,
                fontSize: WeatherDimens.sizeXXXXL,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),

            ///TODO:Change divider's color
            const Divider(
              thickness: 1,
              indent: 110,
              endIndent: 110,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            //TODO:Think about mainAxisAlignment
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const RotatedBox(
                      quarterTurns: 2,
                      child: Icon(
                        Icons.umbrella_outlined,
                      ),
                    ),
                    Text(state.pop),
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.water_drop_outlined,
                    ),
                    Text(state.volume),
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.device_thermostat_outlined,
                    ),
                    Text(state.pressure),
                  ],
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Icon(
                      Icons.air,
                    ),
                    Text(state.windSpeed),
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.explore_outlined,
                    ),
                    Text(state.windDirection),
                  ],
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            const Divider(
              thickness: 1,
              indent: 110,
              endIndent: 110,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            TextButton(
              onPressed: () {},
              child: Text(
                'Share',
                style: WeatherTextStyles.appbar(
                  textColor: ThemeProvider.of(context).theme.accentTextColor,
                  fontSize: WeatherDimens.sizeXXXXL,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
