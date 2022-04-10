import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/domain/entities/main_page_tabs.dart';
import 'package:weather_forecast/injector.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_cubit.dart';
import 'package:weather_forecast/presentation/pages/main_page/main_state.dart';
import 'package:weather_forecast/presentation/pages/main_page/tabs/today/today_tab.dart';
import 'package:weather_forecast/presentation/widgets/weather_appbar.dart';
import 'package:weather_forecast/presentation/theme/theme_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _cubit = locator.get<MainCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      bloc: _cubit,
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
          body: _getCurrentTab(context, state.tab),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.tab.parseTab(),
            onTap: _cubit.setTab,
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

  Widget _getCurrentTab(BuildContext context, MainPageTab tab) {
    switch (tab) {
      case MainPageTab.today:
        _cubit.setTitle('Today');
        return const TodayTab();
      case MainPageTab.forecast:
        return Container(color: Colors.green);
    }
  }
}
