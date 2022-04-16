import 'package:weather_forecast/data/models/location.dart';

abstract class ILocationClient {
  Future<bool> requestPermission();
  Future<bool> requestService();
  Future<bool> serviceEnabled();
  Future<bool> hasLocationPermission();
  Future<Location?> getCurrentLocation();
}