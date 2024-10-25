import 'package:betfair/core/theme/app_colors.dart';
import 'package:betfair/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_text_styles.dart';

class TestViewBody extends StatelessWidget {
  const TestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(
          flex: 5,
        ),
        SizedBox(
            width: double.infinity,
            child: AspectRatio(
                aspectRatio: 1, child: Image.asset(Assets.imagesTest))),
        const Spacer(
          flex: 2,
        ),
        Text(
          "This test will help you to become aware of your fears and better understand which situations cause you the most discomfort.",
          textAlign: TextAlign.center,
          style: AppTextStyles.fontWhiteW400.copyWith(fontSize: 15.sp),
        ),
        const Spacer(
          flex: 1,
        ),
        CustomButton(
            fontColor: AppColors.theme, text: "START", onPressed: () {

              GoRouter.of(context).push(AppRouter.kInstructions);
            }),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
