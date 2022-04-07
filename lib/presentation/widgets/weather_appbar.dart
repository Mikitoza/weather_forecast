import 'package:flutter/material.dart';

class WeatherAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const WeatherAppBar({
    required this.title,
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
      title: Text(widget.title),
      centerTitle: true,
      bottom: _colorLines(
        [
          Colors.black,
          Colors.pink,
        ],
      ),
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
