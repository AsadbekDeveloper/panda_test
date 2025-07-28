import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:panda_test/l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    if (mounted) {
      context.go('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 110),

              Column(
                children: [
                  SvgPicture.asset('assets/icons/panda.svg', width: 240),
                  SizedBox(height: 36),
                  Text('Panda', style: Theme.of(context).textTheme.displayLarge),

                  Text(
                    AppLocalizations.of(context)!.buyAndSellSafely,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              const Spacer(flex: 10),
              Text(AppLocalizations.of(context)!.projectForThePeople, style: Theme.of(context).textTheme.labelMedium),

              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
