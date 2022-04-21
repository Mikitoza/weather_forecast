import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:weather_forecast/injector.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_bloc.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_event.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab_state.dart';
import 'package:weather_forecast/presentation/theme/theme_provider.dart';
import 'package:weather_forecast/presentation/utils/string_ext.dart';
import 'package:weather_forecast/presentation/widgets/weather_dialog.dart';

class TodayTab extends StatefulWidget {
  const TodayTab({Key? key}) : super(key: key);

  @override
  State<TodayTab> createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> {
  final _bloc = locator.get<TodayTabBloc>();

  @override
  void initState() {
    _bloc.add(TodayTabInitializeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodayTabBloc, TodayTabState>(
      listenWhen: (previous, current) {
        return previous.status != current.status;
      },
      listener: (context, state) async {
        if (state.status.isError) {
          _showMyDialog(state.errorDesc);
        }
      },
      bloc: _bloc,
      builder: (context, state) {
        return state.status.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
                    child: Icon(
                      state.icon.parseIcon(),
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
                    onPressed: () async => Share.share(
                        "Weather at ${state.city} in ${state.country}  - ${state.main}.Temperature - ${state.temperature} °C"),
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

  Future<void> _showMyDialog(String desc) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WeatherDialog(
          desc: desc,
        );
      },
    );
  }
}
