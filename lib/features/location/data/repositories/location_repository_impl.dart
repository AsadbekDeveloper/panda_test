import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:panda_test/features/location/data/datasources/location_remote_data_source.dart';
import 'package:panda_test/features/location/domain/repositories/location_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Position>> getCurrentLocation() async {
    try {
      final position = await remoteDataSource.getCurrentLocation();
      return Right(position);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PermissionStatus>> requestPermission() async {
    try {
      final status = await remoteDataSource.requestPermission();
      return Right(status);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
