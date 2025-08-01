import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:panda_test/features/location/presentation/bloc/location_bloc.dart';
import 'package:panda_test/features/location/presentation/bloc/location_event.dart';
import 'package:panda_test/features/location/presentation/bloc/location_state.dart';
import 'package:panda_test/l10n/app_localizations.dart';
import 'package:panda_test/shared/widgets/custom_button.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationAccessPage extends StatefulWidget {
  const LocationAccessPage({super.key});

  @override
  State<LocationAccessPage> createState() => _LocationAccessPageState();
}

class _LocationAccessPageState extends State<LocationAccessPage> with WidgetsBindingObserver {
  PermissionStatus? _status;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      context.read<LocationBloc>().add(RequestPermissionEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          child: BlocConsumer<LocationBloc, LocationState>(
            listener: (context, state) {
              if (state is LocationPermissionGranted) {
                setState(() {
                  _status = state.status;
                });
              }
            },
            builder: (context, state) {
              final isPermanentlyDenied = _status == PermissionStatus.permanentlyDenied;
              final isGranted = _status == PermissionStatus.granted;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 34),
                  Image.asset('assets/icons/location.png'),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.allowLocationAccess,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        AppLocalizations.of(context)!.locationAccessDescription,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  Column(
                    children: [
                      CustomButton(
                        label: isPermanentlyDenied
                            ? AppLocalizations.of(context)!.openSettingsButton
                            : AppLocalizations.of(context)!.allowAccessButton,
                        isExpanded: false,
                        width: double.infinity,
                        onPressed: isGranted
                            ? null
                            : () {
                                if (isPermanentlyDenied) {
                                  openAppSettings();
                                } else {
                                  context.read<LocationBloc>().add(RequestPermissionEvent());
                                }
                              },
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        isExpanded: false,
                        width: double.infinity,
                        onPressed: isGranted
                            ? () {
                                context.go('/home');
                              }
                            : null,
                        type: CustomButtonType.bordered,
                        label: AppLocalizations.of(context)!.specifyLocationButton,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
