import 'package:betfair/core/theme/app_colors.dart';
import 'package:betfair/features/fears/data/model/fear_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_text_styles.dart';

class FearElementDetails extends StatelessWidget {
  final FearModel fearModel;
  const FearElementDetails({
    super.key,
    required this.fearModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        Container(
          padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
          margin: EdgeInsets.only(bottom: 8.h),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.primary,
          ),
          child: Center(
            child: Text(
              fearModel.title,
              textAlign: TextAlign.center,
              style: AppTextStyles.fontBlackW700.copyWith(
                fontSize: 24.sp,
                height: 1.sp,
                color: AppColors.black,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        // Description
        Container(
          padding:
              EdgeInsets.only(left: 24.w, right: 24.h, top: 24.h, bottom: 80.h),
          decoration: BoxDecoration(
            color: AppColors.darkPrimary.withAlpha(80),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            fearModel.description,
            style: AppTextStyles.fontBlackW700.copyWith(
              fontSize: 14.sp,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
