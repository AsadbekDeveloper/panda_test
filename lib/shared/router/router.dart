import 'package:go_router/go_router.dart';
import 'package:panda_test/features/home/presentation/pages/home.dart';
import 'package:panda_test/features/location/presentation/pages/location_access.dart';
import 'package:panda_test/features/onboarding/presentation/pages/onboarding.dart';
import 'package:panda_test/features/splash/presentation/pages/splash.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingPage()),
    GoRoute(path: '/location-access', builder: (context, state) => const LocationAccessPage()),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
  ],
);
