import 'package:betfair/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_text_styles.dart';

class OffenderAppBar extends StatelessWidget {
  const OffenderAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Back button
        SizedBox(
          width: 100.w,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back",
                style: AppTextStyles.fontPrimaryW500.copyWith(
                  fontSize: 26.sp,
                  color: AppColors.lightPrimary,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Text(
            'Add Offender',
            style: AppTextStyles.fontWhiteW700.copyWith(
              fontSize: 22.sp,
            ),
          ),
        ),
        SizedBox(width: 100.w),
      ],
    );
  }
}
