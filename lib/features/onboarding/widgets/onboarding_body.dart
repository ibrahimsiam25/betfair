import 'package:betfair/core/service/shared_preferences_singleton.dart';
import 'package:betfair/core/widgets/custom_button.dart';
import 'package:betfair/features/onboarding/data/model/on_boarding_model.dart';
import 'package:betfair/features/onboarding/widgets/custom_onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/routes/app_router.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  OnboardingBodyState createState() => OnboardingBodyState();
}

class OnboardingBodyState extends State<OnboardingBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onContinuePressed() {
    if (_currentPage < onBoardingData.length - 1) {
      // Navigate to the next page
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      SharedPref.setBool(kIsOnBoardingView, true);
      GoRouter.of(context).go(AppRouter.kBottomNav);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController, // Set the controller here
                itemCount: onBoardingData.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomOnboardingItem(
                    index: index,
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index; // Update current page index
                  });
                },
              ),
            ),
            CustomButton(
              text: "CONTINUE",
              onPressed: _onContinuePressed, // Call the function here
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
