import 'package:betfair/core/theme/app_colors.dart';
import 'package:betfair/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'settings_element.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Back button
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Back",
              style: AppTextStyles.fontPrimaryW500.copyWith(
                fontSize: 26.sp,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Rate us
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rate us!',
                            style: AppTextStyles.fontBlackW700.copyWith(
                              fontSize: 22.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Your feedback helps\nus to improve',
                            style: AppTextStyles.fontBlackW400.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Give a rate',
                            style: AppTextStyles.fontBlackW400.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),

                //Website
                const SettingsElement(
                  title: 'Developer’s website',
                ),
                SizedBox(height: 8.h),
                //Privacy policy
                const SettingsElement(
                  title: 'Privacy Policy',
                ),
                SizedBox(height: 8.h),
                //Support
                const SettingsElement(
                  title: 'Support Page',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
