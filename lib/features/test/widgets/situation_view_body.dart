import 'package:betfair/features/test/data/static/situation_data.dart';
import 'package:betfair/features/test/widgets/situation_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';

class SituationViewBody extends StatefulWidget {
  const SituationViewBody({super.key});

  @override
  State<SituationViewBody> createState() => _SituationViewBodyState();
}

class _SituationViewBodyState extends State<SituationViewBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<int> rateOfSituation = List.filled(situationData.length, situationData.length);

  void _nextPage() {
    if (_currentPage < situationData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() => _currentPage++);
    } else {
      GoRouter.of(context).push(AppRouter.kSituationSave,
      extra: rateOfSituation
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() => _currentPage--);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () => _previousPage(),
            child: Text(
              "Back",
              style: AppTextStyles.fontPrimaryW500.copyWith(fontSize: 22.sp),
            ),
          ),
        ),
        const Spacer(flex: 2),
        SituationPageView(
          pageController: _pageController,
          onPageChanged: (index) => setState(() => _currentPage = index),
          rateOfSituation: rateOfSituation,
        ),
        const Spacer(flex: 5),
        CustomButton(
          fontColor: AppColors.theme,
          text: "NEXT",
          onPressed: _nextPage,
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
