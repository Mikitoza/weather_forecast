import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/data/models/location.dart';
import 'package:weather_forecast/injector.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_cubit.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_state.dart';
import 'package:weather_forecast/presentation/theme/theme_provider.dart';

class TodayTab extends StatefulWidget {
  const TodayTab({Key? key}) : super(key: key);

  @override
  State<TodayTab> createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> with AutomaticKeepAliveClientMixin{
  final _cubit = locator.get<TodayTabCubit>();

  @override
  void initState() {
    _cubit.init(
      Location(lat: 51.509865, lon: -0.118092),
    );
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

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
            Text(
              '${state.city}, ${state.country}',
              style: ThemeProvider.of(context).theme.primaryItalicTextStyle,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              '${state.temperature}°C | ${state.main}',
              style: ThemeProvider.of(context).theme.actionTextStyle,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
                    RotatedBox(
                      quarterTurns: 2,
                      child: Icon(
                        Icons.umbrella_outlined,
                        color: ThemeProvider.of(context).theme.accentColor,
                        size: 32,
                      ),
                    ),
                    Text('${state.pop}%'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.water_drop_outlined,
                      color: ThemeProvider.of(context).theme.accentColor,
                      size: 32,
                    ),
                    Text('${state.volume} mm'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.device_thermostat_outlined,
                      color: ThemeProvider.of(context).theme.accentColor,
                      size: 32,
                    ),
                    Text('${state.pressure} hPa'),
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
                    Icon(
                      Icons.air,
                      color: ThemeProvider.of(context).theme.accentColor,
                      size: 32,
                    ),
                    Text('${state.windSpeed} km/h'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.explore_outlined,
                      color: ThemeProvider.of(context).theme.accentColor,
                      size: 32,
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
                style: ThemeProvider.of(context).theme.accentTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }
}
