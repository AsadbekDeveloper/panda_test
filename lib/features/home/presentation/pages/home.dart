import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panda_test/features/location/presentation/bloc/location_bloc.dart';
import 'package:panda_test/features/location/presentation/bloc/location_event.dart';
import 'package:panda_test/features/location/presentation/bloc/location_state.dart';
import 'package:panda_test/l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().add(GetLocationEvent());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LocationLoaded) {
            return Center(
              child: Text(
                '${l10n.latitude}: ${state.position.latitude}, ${l10n.longitude}: ${state.position.longitude}',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            );
          }
          if (state is LocationError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
