import 'package:betfair/core/theme/app_colors.dart';
import 'package:betfair/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsElement extends StatelessWidget {
  final String title;
  const SettingsElement({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.fontBlackW700.copyWith(
              fontSize: 17.sp,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
