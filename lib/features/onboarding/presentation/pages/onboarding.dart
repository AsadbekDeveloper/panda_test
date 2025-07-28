import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:panda_test/features/onboarding/presentation/cubit/locale_cubit.dart';
import 'package:panda_test/l10n/app_localizations.dart';
import 'package:panda_test/shared/widgets/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = context.watch<LocaleCubit>().state.locale;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 110),
              Column(
                children: [
                  SvgPicture.asset('assets/icons/panda.svg', width: 240),
                  const SizedBox(height: 36),
                  Text('Panda', style: Theme.of(context).textTheme.displayLarge),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    l10n.chooseLanguage,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 36),
                  Row(
                    children: [
                      CustomButton(
                        type: currentLocale.languageCode == 'uz'
                            ? CustomButtonType.filled
                            : CustomButtonType.bordered,
                        label: 'O\'zbekcha',
                        onPressed: () =>
                            context.read<LocaleCubit>().toUzbek(),
                      ),
                      const SizedBox(width: 16),
                      CustomButton(
                        type: currentLocale.languageCode == 'ru'
                            ? CustomButtonType.filled
                            : CustomButtonType.bordered,
                        label: 'Русский',
                        onPressed: () =>
                            context.read<LocaleCubit>().toRussian(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    isExpanded: false,
                    width: double.infinity,
                    onPressed: () {
                      context.push('/location-access');
                    },
                    label: l10n.continueButton,
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
