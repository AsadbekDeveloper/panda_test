import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panda_test/features/location/domain/usecases/get_current_location.dart';
import 'package:panda_test/features/location/domain/usecases/request_permission.dart';
import 'package:panda_test/features/location/presentation/bloc/location_event.dart';
import 'package:panda_test/features/location/presentation/bloc/location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetCurrentLocation getCurrentLocation;
  final RequestPermission requestPermission;

  LocationBloc({
    required this.getCurrentLocation,
    required this.requestPermission,
  }) : super(LocationInitial()) {
    on<GetLocationEvent>(_onGetLocation);
    on<RequestPermissionEvent>(_onRequestPermission);
  }

  void _onGetLocation(GetLocationEvent event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    final failureOrPosition = await getCurrentLocation();
    failureOrPosition.fold(
      (failure) => emit(LocationError(failure.message)),
      (position) => emit(LocationLoaded(position)),
    );
  }

  void _onRequestPermission(
      RequestPermissionEvent event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    final failureOrStatus = await requestPermission();
    failureOrStatus.fold(
      (failure) => emit(LocationError(failure.message)),
      (status) => emit(LocationPermissionGranted(status)),
    );
  }
}
