import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class FearsElement extends StatelessWidget {
  const FearsElement({super.key, required this.rate, required this.fear});
final int rate;
final String fear;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10.r),
      ) ,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(fear, style: AppTextStyles.fontBlackW400.copyWith(fontSize: 22.sp),),
            SizedBox(height: 10.h,),
            ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ) ,
            child: 
            Text("Defeated", style: AppTextStyles.fontBlackW700.copyWith(fontSize: 18.sp,color: AppColors.green),),
            )
          ],),
         const Spacer(),
          Text("$rate", style: AppTextStyles.fontBlackW700.copyWith(fontSize: 24.sp,color: AppColors.green),),
          SvgPicture.asset(
            width: 8.w,
            height: 8.h,
            Assets.imagesDown)
        ],
      ),
    );
  }
}