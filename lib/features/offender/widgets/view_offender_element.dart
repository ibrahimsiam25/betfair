import 'package:betfair/core/theme/app_colors.dart';
import 'package:betfair/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewOffenderElement extends StatelessWidget {
  final String title;
  final Widget element;
  const ViewOffenderElement({
    super.key,
    required this.title,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, top: 4.h, bottom: 4.h, right: 8.w),
      margin: EdgeInsets.only(bottom: 8.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.primary,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.fontBlackW700.copyWith(
              fontSize: 20.sp,
            ),
          ),
          const Spacer(),
          element,
        ],
      ),
    );
  }
}
