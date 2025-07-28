import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:panda_test/features/onboarding/presentation/cubit/locale_cubit.dart';
import 'package:panda_test/l10n/app_localizations.dart';
import 'package:panda_test/shared/router/router.dart';
import 'package:panda_test/shared/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            title: 'Panda',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            locale: state.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('ru'), Locale('uz')],
          );
        },
      ),
    );
  }
}
