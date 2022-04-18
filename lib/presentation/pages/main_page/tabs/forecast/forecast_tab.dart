import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/domain/entities/forecast_tile.dart';
import 'package:weather_forecast/injector.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/forecast/forecast_tab_cubit.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/forecast/forecast_tab_state.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/presentation/theme/theme_provider.dart';
import 'package:weather_forecast/presentation/utils/string_ext.dart';
import 'package:weather_forecast/presentation/utils/weather_dimens.dart';
import 'package:weather_forecast/presentation/widgets/weather_dialog.dart';

class ForecastTab extends StatefulWidget {
  const ForecastTab({Key? key}) : super(key: key);

  @override
  State<ForecastTab> createState() => _ForecastTabState();
}

class _ForecastTabState extends State<ForecastTab> {
  final _cubit = locator.get<ForecastTabCubit>();

  @override
  void initState() {
    _cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForecastTabCubit, ForecastTabState>(
      listenWhen: (previous, current) {
        return previous.isError != current.isError;
      },
      listener: (context, state) async {
        if (state.isError) {
          _showMyDialog('Some problems');
        }
        _cubit.changeIsError(false);
      },
      bloc: _cubit,
      builder: (context, state) {
        return state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.forecast.length,
                itemBuilder: (context, index) => index == 0 ||
                        state.forecast[index].time.day != state.forecast[index - 1].time.day
                    ? _weatherListTileWithWeekDay(state.forecast[index])
                    : _weatherListTile(
                        state.forecast[index],
                        isNotBordered: index != state.forecast.length - 1
                            ? state.forecast[index].time.day != state.forecast[index + 1].time.day
                            : true,
                      ),
              );
      },
    );
  }

  Widget _weatherListTile(ForecastTile tile, {bool isNotBordered = false}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    tile.icon.parseIcon(),
                    size: 60,
                    color: Colors.yellow,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('Hm').format(tile.time),
                      style: ThemeProvider.of(context).theme.appbarTextStyle,
                    ),
                    const SizedBox(height: 4),
                    Text(tile.desc),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(WeatherDimens.sizeM),
              child: Text(
                '${tile.temperature} °C',
                style: ThemeProvider.of(context).theme.actionTextStyle,
              ),
            ),
          ],
        ),
        if (!isNotBordered)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.1,
                color: ThemeProvider.of(context).theme.dividerColor,
              ),
            ),
          ),
      ],
    );
  }

  Widget _weatherListTileWithWeekDay(ForecastTile tile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.1,
              color: ThemeProvider.of(context).theme.dividerColor,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(WeatherDimens.sizeM),
            child: tile.time.day == DateTime.now().day
                ? Text(
                    'TODAY',
                    style: ThemeProvider.of(context).theme.appbarTextStyle,
                  )
                : Text(
                    DateFormat('EEEE').format(tile.time),
                    style: ThemeProvider.of(context).theme.appbarTextStyle,
                  ),
          ),
        ),
        _weatherListTile(tile)
      ],
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
