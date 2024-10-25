import 'package:betfair/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_button.dart';

class InstructionsViewBody extends StatelessWidget {
  const InstructionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Back",
              style: AppTextStyles.fontPrimaryW500.copyWith(
                fontSize: 22.sp,
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 6,
        ),
        Text(
          "Instructions",
          style: AppTextStyles.fontWhiteW500.copyWith(fontSize: 35.sp),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Text(
            "Read through each situation and rate your level of fear or anxiety on a scale of 0 to 10, with 0 being ‘not at all afraid’ and 10 being ‘extremely afraid’.",
            textAlign: TextAlign.center,
            style: AppTextStyles.fontWhiteW500.copyWith(fontSize: 16.sp),
          ),
        ),
        const Spacer(
          flex: 6,
        ),
        CustomButton(
            fontColor: AppColors.theme,
            text: "CONTINUE",
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSituation);
            }),
        const Spacer(),
      ],
    );
  }
}
