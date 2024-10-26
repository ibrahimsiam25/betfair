import 'package:betfair/features/edit_fear/views/edit_fear_view.dart';
import 'package:betfair/features/home/views/bottom_nav_bar.dart';
import 'package:betfair/features/offender/views/offender_view.dart';
import 'package:betfair/features/offender/widgets/add_offender_name_and_cause.dart';
import 'package:betfair/features/offender/widgets/add_offender_socials.dart';
import 'package:betfair/features/offender/widgets/view_offender_name.dart';
import 'package:betfair/features/offender/widgets/view_offender_socials.dart';
import 'package:betfair/features/onboarding/views/onboarding_view.dart';
import 'package:betfair/features/settings/views/settings_view.dart';
import 'package:betfair/features/test/views/instructions_view.dart';
import 'package:betfair/features/test/views/situation_view.dart';
import 'package:betfair/features/test/views/test_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/fears/views/new_fears_one_view.dart';
import '../../features/fears/views/new_fears_three_view.dart';
import '../../features/fears/views/new_fears_two_view.dart';
import '../../features/test/views/situation_final_view.dart';
import '../../features/test/views/situation_save_view.dart';
import '../models/fears_model.dart';

abstract class AppRouter {
  static const String kOnBoardingView = '/onBoardingView';
  static const String kBottomNav = '/bottomNav';
  static const String kNewOneFears = '/newOneFears';
  static const String kNewTwoFears = '/newTwoFears';
  static const String kNewThreeFears = '/newThreeFears';
  static const String kTest = '/test';
  static const String kInstructions = '/instructions';
  static const String kSituation = '/situation';
  static const String kSituationSave = '/situationSave';
  static const String kSituationFinal = '/situationFinal';
  static const String kSettings = '/settings';
  static const String kOffender = '/offender';
  static const String kOffenderName = '/offenderName';
  static const String kOffenderSocilas = '/offenderSocilas';
  static const String kViewOffenderName = '/viewoffendername';
  static const String kViewOffenderSocilas = '/viewoffenderSocilas';
  static const String kEditFear = '/editFear';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kBottomNav,
        builder: (context, state) => const BottomNavigationBarController(),
      ),
      GoRoute(
        path: kNewOneFears,
        builder: (context, state) => const NewFearsOneView(),
      ),
      GoRoute(
        path: kNewTwoFears,
        builder: (context, state) => NewFearsTwoView(
          fearsMap: state.extra as Map<String, dynamic>,
        ),
      ),
      GoRoute(
        path: kNewThreeFears,
        builder: (context, state) => NewFearsThreeView(
          fearsMap: state.extra as Map<String, dynamic>,
        ),
      ),
      GoRoute(
          path: kTest,
          builder: (context, state) {
            return const TestView();
          }),
      GoRoute(
          path: kInstructions,
          builder: (context, state) {
            return const InstructionsView();
          }),
      GoRoute(
          path: kSituation,
          builder: (context, state) {
            return const SituationView();
          }),
      GoRoute(
          path: kSituationSave,
          builder: (context, state) {
            return SituationSaveView(
              rateOfSituation: state.extra as List<int>,
            );
          }),
      GoRoute(
          path: kSettings,
          builder: (context, state) {
            return const SettingsView();
          }),
      GoRoute(
          path: kSituationFinal,
          builder: (context, state) {
            return const SituationFinalView();
          }),
      GoRoute(
          path: kOffender,
          builder: (context, state) {
            return const OffenderView();
          }),
      GoRoute(
          path: kOffenderName,
          builder: (context, state) {
            return const AddOffenderNameAndCause();
          }),
      GoRoute(
          path: kOffenderSocilas,
          builder: (context, state) {
            return const AddOffenderSocials();
          }),
      GoRoute(
          path: kViewOffenderName,
          builder: (context, state) {
            return const ViewOffenderName();
          }),
      GoRoute(
          path: kViewOffenderSocilas,
          builder: (context, state) {
            return const ViewOffenderSocials();
          }),
      GoRoute(
          path: kEditFear,
          builder: (context, state) {
            return  EditFearView(
              fearModel:state.extra as FearModel,
            );
          }),
    ],
  );
}
