import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:panda_test/l10n/app_localizations.dart';
import 'package:panda_test/shared/widgets/custom_button.dart';

class LocationAccessPage extends StatelessWidget {
  const LocationAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 34),
              Image.asset('assets/icons/location.png'),
              Spacer(),
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
                    isExpanded: false,
                    width: double.infinity,
                    onPressed: () {},
                    label: AppLocalizations.of(context)!.allowAccessButton,
                  ),
                  const SizedBox(height: 16),

                  CustomButton(
                    isExpanded: false,
                    width: double.infinity,
                    onPressed: () {
                      context.go('/home');
                    },
                    type: CustomButtonType.bordered,
                    label: AppLocalizations.of(context)!.specifyLocationButton,
                  ),
                ],
              ),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
