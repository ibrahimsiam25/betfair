import 'package:betfair/features/home/views/home_view.dart';
import 'package:betfair/features/onboarding/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';


abstract class AppRouter {

  static const String kOnBoardingView = '/onBoardingView';

  static const String kHomeView = '/home';


  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/d",
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => const HomeView(),
      ),
 
    ],

  );
}
