import 'package:betfair/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_text_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.Ksettings);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          child: Text(
            "Settings",
            style: AppTextStyles.fontPrimaryW700.copyWith(fontSize: 16.sp),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 120.w,
          height: 30.h,
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kTest);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "TEST",
              style: AppTextStyles.fontBlackW700.copyWith(fontSize: 16.sp),
            ),
          ),
        ),
        SizedBox(width: 16.w),
      ],
    );
  }
}
