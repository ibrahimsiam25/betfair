import 'package:betfair/features/home/views/bottom_nav_bar.dart';
import 'package:betfair/features/onboarding/views/onboarding_view.dart';
import 'package:betfair/features/test/views/test_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/fears/views/new_fears_one_view.dart';
import '../../features/fears/views/new_fears_three_view.dart';
import '../../features/fears/views/new_fears_two_view.dart';

abstract class AppRouter {
  static const String kOnBoardingView = '/onBoardingView';
  static const String kBottomNav = '/bottomNav';
  static const String kNewOneFears = '/newOneFears';
  static const String kNewTwoFears = '/newTwoFears';
  static const String kNewThreeFears = '/newThreeFears';
  static const String kTest = '/test';

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
        path: kNewOneFears,
        builder: (context, state) => const NewFearsOneView(),
      ),
         GoRoute(
        path: kNewTwoFears,
        builder: (context, state) =>  NewFearsTwoView(
          fearsMap: state.extra as Map<String, dynamic>,
        ),
      ),   GoRoute(
        path: kNewThreeFears,
        builder: (context, state) =>  NewFearsThreeView(
          fearsMap: state.extra as Map<String, dynamic>,
        ),
      ),
      GoRoute(path: kTest, builder: (context, state) {
        return  const TestView();
      }),
    ],
  );
}
