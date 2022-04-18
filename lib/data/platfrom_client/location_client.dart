import 'package:weather_forecast/data/models/location.dart' as model;
import 'package:location/location.dart';

class LocationClient{
  final Location _location = Location();

  Future<model.Location?> getCurrentLocation() async {
    var serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }
    var permissionStatus = await _location.hasPermission();
    if (permissionStatus != PermissionStatus.granted &&
        permissionStatus != PermissionStatus.grantedLimited) {
      permissionStatus = await _location.requestPermission();
      if (permissionStatus != PermissionStatus.granted &&
          permissionStatus != PermissionStatus.grantedLimited) {
        return null;
      }
    }
    final currentLocation = await _location.getLocation().then((value) {
      if (value.latitude == null || value.longitude == null) {
        return null;
      } else {
        return model.Location(lat: value.latitude!, lon: value.longitude!);
      }
    });
    return currentLocation;
  }

  Future<bool> hasLocationPermission() async {
    final result = await _location.hasPermission();
    return result == PermissionStatus.granted || result == PermissionStatus.grantedLimited;
  }

  Future<bool> requestPermission() async {
    final result = await _location.requestPermission();
    return result == PermissionStatus.granted || result == PermissionStatus.grantedLimited;
  }

  Future<bool> requestService() async {
    return _location.requestService();
  }

  Future<bool> serviceEnabled() {
    return _location.serviceEnabled();
  }

}