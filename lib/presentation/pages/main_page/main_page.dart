import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/injector.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_bloc.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_event.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_state.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/forecast/forecast_tab.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab.dart';
import 'package:weather_forecast/presentation/widgets/keep_alive_page.dart';
import 'package:weather_forecast/presentation/widgets/weather_appbar.dart';
import 'package:weather_forecast/presentation/theme/theme_provider.dart';
import 'package:weather_forecast/presentation/widgets/weather_dialog.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _bloc = locator.get<MainBloc>();
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    hasNetwork();
  }

  void hasNetwork() async {
    _bloc.add(MainCheckNetworkEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
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
        return Scaffold(
          backgroundColor: ThemeProvider.of(context).theme.primaryBackgroundColor,
          appBar: WeatherAppBar(
            title: state.title,
            colors: const [
              Colors.black,
              Colors.pink,
              Colors.red,
              Colors.yellowAccent,
            ],
          ),
          body: PageView(
            onPageChanged: (index) => _bloc.add(MainChangeTabEvent(index)),
            controller: _controller,
            children: const [
              KeepAlivePage(child: TodayTab()),
              KeepAlivePage(child: ForecastTab()),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.pageIndex,
            onTap: (int index) {
              _controller.jumpToPage(index);
              _bloc.add(MainChangeTabEvent(index));
            },
            backgroundColor: ThemeProvider.of(context).theme.primaryBackgroundColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.wb_sunny_outlined),
                label: 'Today',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.cloud),
                label: 'Forecast',
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showMyDialog(String desc) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WeatherDialog(
          desc: desc,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
