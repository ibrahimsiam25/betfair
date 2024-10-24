import 'package:betfair/features/home/views/bottom_nav_bar.dart';
import 'package:betfair/features/onboarding/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/fears/views/new_fears_view.dart';

abstract class AppRouter {
  static const String kOnBoardingView = '/onBoardingView';
  static const String kBottomNav = '/bottomNav';
  static const String kNewFears = '/newFears';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/d",
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => const BottomNavigationBarController(),
      ),
      GoRoute(
        path: kNewFears,
        builder: (context, state) => const NewFearsView(),
      ),
    ],
  );
}
