import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:panda_test/features/location/domain/repositories/location_repository.dart';

class GetCurrentLocation {
  final LocationRepository repository;

  GetCurrentLocation(this.repository);

  Future<Either<Failure, Position>> call() async {
    return await repository.getCurrentLocation();
  }
}
