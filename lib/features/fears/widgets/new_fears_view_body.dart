import 'dart:ui';
import 'package:betfair/core/theme/app_colors.dart';
import 'package:betfair/features/fears/widgets/new_fear_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/custom_text_feild.dart';

class NewFearsViewBody extends StatelessWidget {
  const NewFearsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          const NewFearAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Who or what are you afraid of?",
                    style: AppTextStyles.fontWhiteW400.copyWith(fontSize: 16.sp),
                  ),
                ),
                SizedBox(height: 3.h),

 CustomTextField(),


            ]),
          )
        ],
      ),
    );
  }
}
