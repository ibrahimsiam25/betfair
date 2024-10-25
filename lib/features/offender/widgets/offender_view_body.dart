import 'package:betfair/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_text_styles.dart';

class OffenderViewBody extends StatelessWidget {
  const OffenderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Row(
          children: [
            SizedBox(width: 16.w),
            Text(
              'The purpose of adding the\nability to drop a link to a\nsocial media profile is to\nallow the user to see their\nopponent in person,\ncreating a personalised\nelement to the\ncommunication. This can\nhelp in the context of\nresolving conflicts or\nmisunderstandings.',
              textAlign: TextAlign.center,
              style: AppTextStyles.fontPrimaryW500.copyWith(
                fontSize: 14.sp,
              ),
            ),
            const Spacer(),
            Image.asset(
              Assets.imagesOffender,
              width: 150.w,
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kOffenderName);
          },
          child: Text(
            'Click to continue',
            style: AppTextStyles.fontWhiteW700.copyWith(
              color: AppColors.white.withOpacity(0.5),
              fontSize: 18.sp,
            ),
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
