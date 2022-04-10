import 'package:weather_forecast/presentation/theme/weather_theme.dart';
import 'package:weather_forecast/presentation/utils/weather_colors.dart';
import 'package:weather_forecast/presentation/utils/weather_dimens.dart';
import 'package:weather_forecast/presentation/utils/weather_text_styles.dart';

final lightTheme = WeatherTheme(
  primaryColor: WeatherColors.lightYellow,
  accentColor: WeatherColors.lightYellow,
  primaryBackgroundColor: WeatherColors.white,
  primaryTextColor: WeatherColors.black,
  accentTextColor: WeatherColors.orange,
  actionTextColor: WeatherColors.blue,
  primaryTextStyle: WeatherTextStyles.base(
    fontSize: WeatherDimens.sizeL,
    textColor: WeatherColors.black,
  ),
  appbarTextStyle: WeatherTextStyles.appbar(
    textColor: WeatherColors.black,
    fontSize: WeatherDimens.sizeL,
  ),
  accentTextStyle: WeatherTextStyles.base(
    fontSize: WeatherDimens.sizeL,
    textColor: WeatherColors.orange,
  ),
);

final darkTheme = WeatherTheme(
  primaryColor: WeatherColors.lightYellow,
  accentColor: WeatherColors.blue,
  primaryBackgroundColor: WeatherColors.white,
  primaryTextColor: WeatherColors.black,
  accentTextColor: WeatherColors.orange,
  actionTextColor: WeatherColors.blue,
  primaryTextStyle: WeatherTextStyles.base(
    fontSize: WeatherDimens.sizeL,
    textColor: WeatherColors.black,
  ),
  appbarTextStyle: WeatherTextStyles.appbar(
    textColor: WeatherColors.black,
    fontSize: WeatherDimens.sizeL,
  ),
  accentTextStyle: WeatherTextStyles.base(
    fontSize: WeatherDimens.sizeL,
    textColor: WeatherColors.orange,
  ),
);
