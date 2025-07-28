import 'package:get_it/get_it.dart';
import 'package:panda_test/features/location/data/datasources/location_remote_data_source.dart';
import 'package:panda_test/features/location/data/repositories/location_repository_impl.dart';
import 'package:panda_test/features/location/domain/repositories/location_repository.dart';
import 'package:panda_test/features/location/domain/usecases/get_current_location.dart';
import 'package:panda_test/features/location/domain/usecases/request_permission.dart';
import 'package:panda_test/features/location/presentation/bloc/location_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => LocationBloc(getCurrentLocation: sl(), requestPermission: sl()));

  sl.registerLazySingleton(() => GetCurrentLocation(sl()));
  sl.registerLazySingleton(() => RequestPermission(sl()));

  sl.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<LocationRemoteDataSource>(() => LocationRemoteDataSourceImpl());
}
