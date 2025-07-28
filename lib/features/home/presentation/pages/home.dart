import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panda_test/features/location/presentation/bloc/location_bloc.dart';
import 'package:panda_test/features/location/presentation/bloc/location_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationLoaded) {
            return Center(
              child: Text(
                  'Latitude: ${state.position.latitude}, Longitude: ${state.position.longitude}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
