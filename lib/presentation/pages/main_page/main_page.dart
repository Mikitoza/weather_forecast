import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/widgets/weather_appbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeatherAppBar(
        title: 'test',
      ),
    );
  }
}
