import 'package:betfair/core/theme/app_colors.dart';
import 'package:betfair/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffenderBackButton extends StatelessWidget {
  const OffenderBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88.w,
      child: InkWell(
        onTap: () {
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
    );
  }
}
