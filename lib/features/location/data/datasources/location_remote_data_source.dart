import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class LocationRemoteDataSource {
  Future<Position> getCurrentLocation();
  Future<PermissionStatus> requestPermission();
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<PermissionStatus> requestPermission() async {
    return await Permission.location.request();
  }
}
