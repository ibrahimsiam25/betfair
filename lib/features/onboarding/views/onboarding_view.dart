import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/features/onboarding/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_scaffold.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: const OnboardingBody(),
    );
  }
}

