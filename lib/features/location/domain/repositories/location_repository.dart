import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class LocationRepository {
  Future<Either<Failure, Position>> getCurrentLocation();
  Future<Either<Failure, PermissionStatus>> requestPermission();
}

class Failure {
  final String message;

  Failure(this.message);
}
