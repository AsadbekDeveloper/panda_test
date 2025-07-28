import 'package:dartz/dartz.dart';
import 'package:panda_test/features/location/domain/repositories/location_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermission {
  final LocationRepository repository;

  RequestPermission(this.repository);

  Future<Either<Failure, PermissionStatus>> call() async {
    return await repository.requestPermission();
  }
}
