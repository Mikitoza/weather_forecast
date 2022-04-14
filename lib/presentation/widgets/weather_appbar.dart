import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/theme/theme_provider.dart';

class WeatherAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<Color> colors;

  const WeatherAppBar({
    required this.title,
    required this.colors,
    Key? key,
  }) : super(key: key);

  @override
  _WeatherAppBarState createState() => _WeatherAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _WeatherAppBarState extends State<WeatherAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeProvider.of(context).theme.primaryBackgroundColor,
      title: Text(
        widget.title,
        style: ThemeProvider.of(context).theme.appbarTextStyle,
      ),
      centerTitle: true,
      bottom: _colorLines(widget.colors),
    );
  }

  ///TODO:Read about correct using of preferredSize
  PreferredSizeWidget _colorLines(List<Color> colors) {
    return PreferredSize(
      child: Row(
        children: [
          ...colors.map(
            (color) => Container(
              color: color,
              height: 4,
              width: MediaQuery.of(context).size.width / colors.length,
            ),
          ),
        ],
      ),
      preferredSize: const Size.fromHeight(4),
    );
  }
}
