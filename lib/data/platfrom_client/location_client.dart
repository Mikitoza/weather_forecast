import 'package:weather_forecast/data/models/location.dart' as model;
import 'package:location/location.dart';
import 'package:weather_forecast/data/platfrom_client/interfaces/i_location_client.dart';

class LocationClient implements ILocationClient{
  final Location _location = Location();

  @override
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

  @override
  Future<bool> hasLocationPermission() async {
    final result = await _location.hasPermission();
    return result == PermissionStatus.granted || result == PermissionStatus.grantedLimited;
  }

  @override
  Future<bool> requestPermission() async {
    final result = await _location.requestPermission();
    return result == PermissionStatus.granted || result == PermissionStatus.grantedLimited;
  }

  @override
  Future<bool> requestService() async {
    return _location.requestService();
  }

  @override
  Future<bool> serviceEnabled() {
    return _location.serviceEnabled();
  }

}