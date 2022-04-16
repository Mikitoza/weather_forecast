import 'package:dio/dio.dart';
import 'package:weather_forecast/data/datasources/interfaces/i_remote_data_sources.dart';
import 'package:weather_forecast/data/models/api_object.dart';
import 'package:weather_forecast/data/models/location.dart';

class RemoteDataSource implements IRemoteDataSource {
  final _dio = Dio();
  final _baseUrl = 'http://api.openweathermap.org/data/2.5';
  final _apiKey = '50964f9dc17d20bc5b72d2f965503fce';
  final _units = 'metric';

  @override
  Future<ApiObject> getWeathersList(Location location) async {
    final Response response = await _dio.get(
      _baseUrl + '/forecast',
      queryParameters: {
        'lat': location.lat,
        'lon': location.lon,
        'appid': _apiKey,
        'units': _units,
      },
    );

    ApiObject apiObject = ApiObject.fromJson(response.data);
    return apiObject;
  }
}
