import 'package:dio/dio.dart';
import 'package:weather_forecast/data/datasources/interfaces/i_remote_data_sources.dart';
import 'package:weather_forecast/data/models/api_object.dart';
import 'package:weather_forecast/domain/entities/location.dart';

class RemoteDataSource implements IRemoteDataSource {
  final _dio = Dio();
  final _baseUrl = 'api.openweathermap.org/data/2.5';

  @override
  Future<ApiObject> getWeather(Location location) async {
    final response = await _dio.get(
        '/forecast?lat=${location.lat}9&lon=${location.lon}&appid=50964f9dc17d20bc5b72d2f965503fce');
    return response;
  }
}
